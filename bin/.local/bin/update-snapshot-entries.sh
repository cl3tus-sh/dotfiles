#!/bin/bash

# Script pour générer automatiquement les entrées systemd-boot pour les snapshots Snapper
# Usage: sudo ./update-snapshot-entries.sh

set -e

# Couleurs pour l'output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Détection automatique de la configuration
echo -e "${BLUE}Détection de la configuration système...${NC}"

# Trouver le répertoire des entrées systemd-boot
if [ -d "/efi/loader/entries" ]; then
    EFI_DIR="/efi/loader/entries"
elif [ -d "/boot/loader/entries" ]; then
    EFI_DIR="/boot/loader/entries"
elif [ -d "/boot/efi/loader/entries" ]; then
    EFI_DIR="/boot/efi/loader/entries"
else
    echo -e "${RED}Impossible de trouver le répertoire des entrées systemd-boot${NC}"
    exit 1
fi
echo -e "  EFI_DIR: ${GREEN}$EFI_DIR${NC}"

# Détecter le machine-id
MACHINE_ID=$(cat /etc/machine-id)
echo -e "  MACHINE_ID: ${GREEN}$MACHINE_ID${NC}"

# Détecter l'UUID de la partition root
ROOT_UUID=$(findmnt -n -o UUID /)
echo -e "  ROOT_UUID: ${GREEN}$ROOT_UUID${NC}"

# Trouver l'entrée principale EndeavourOS pour extraire les paramètres
MAIN_ENTRY=$(ls -1 "$EFI_DIR"/*.conf 2>/dev/null | grep -v "fallback\|snapshot" | head -1)

if [ -z "$MAIN_ENTRY" ] || [ ! -f "$MAIN_ENTRY" ]; then
    echo -e "${RED}Impossible de trouver l'entrée principale systemd-boot${NC}"
    exit 1
fi
echo -e "  Entrée de référence: ${GREEN}$(basename "$MAIN_ENTRY")${NC}"

# Extraire les informations de l'entrée principale
KERNEL_VERSION=$(grep "^version" "$MAIN_ENTRY" | awk '{print $2}' | head -1)
LINUX_PATH=$(grep "^linux" "$MAIN_ENTRY" | awk '{print $2}' | head -1)
INITRD_PATH=$(grep "^initrd" "$MAIN_ENTRY" | awk '{print $2}' | head -1)
OPTIONS_LINE=$(grep "^options" "$MAIN_ENTRY" | sed 's/^options[[:space:]]*//')

# Remplacer le rootflags pour pointer vers @ (on le modifiera pour les snapshots)
BASE_OPTIONS=$(echo "$OPTIONS_LINE" | sed 's/rootflags=subvol=[^[:space:]]*/rootflags=subvol=@/')

echo -e "  KERNEL_VERSION: ${GREEN}$KERNEL_VERSION${NC}"
echo -e "  LINUX_PATH: ${GREEN}$LINUX_PATH${NC}"
echo -e "  INITRD_PATH: ${GREEN}$INITRD_PATH${NC}"

SNAPSHOT_PREFIX="snapshot"

echo ""

# Vérifier qu'on est root
if [ "$EUID" -ne 0 ]; then 
    echo -e "${RED}Ce script doit être exécuté en tant que root${NC}"
    exit 1
fi

echo -e "\n${GREEN}=== Mise à jour des entrées de snapshot systemd-boot ===${NC}\n"

# Supprimer les anciennes entrées de snapshot
echo -e "${YELLOW}Suppression des anciennes entrées de snapshot...${NC}"
rm -f "$EFI_DIR/$SNAPSHOT_PREFIX"-*.conf
echo -e "${GREEN}✓ Anciennes entrées supprimées${NC}\n"

# Récupérer la liste des snapshots (sauf le snapshot 0 qui est "current")
SNAPSHOTS=$(snapper -c root list | tail -n +3 | awk '{print $1}' | grep -v '^0$' | sort -n)

if [ -z "$SNAPSHOTS" ]; then
    echo -e "${YELLOW}Aucun snapshot trouvé${NC}"
    exit 0
fi

echo -e "${GREEN}Snapshots trouvés:${NC}"
snapper -c root list
echo ""

# Créer une entrée pour chaque snapshot
COUNT=0
for SNAP_NUM in $SNAPSHOTS; do
    # Récupérer la description du snapshot
    DESCRIPTION=$(snapper -c root list | grep "^$SNAP_NUM " | awk -F'│' '{print $7}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    
    # Nom du fichier de l'entrée avec padding (ex: snapshot-001.conf)
    ENTRY_FILE="$EFI_DIR/$SNAPSHOT_PREFIX-$(printf "%03d" $SNAP_NUM).conf"
    
    echo -e "${YELLOW}Création de l'entrée pour le snapshot #$SNAP_NUM...${NC}"
    
    # Modifier les options pour pointer vers le snapshot
    SNAPSHOT_OPTIONS=$(echo "$BASE_OPTIONS" | sed "s|rootflags=subvol=@|rootflags=subvol=@/.snapshots/$SNAP_NUM/snapshot|")
    
    # Créer l'entrée
    cat > "$ENTRY_FILE" <<EOF
title      EndeavourOS Snapshot #$SNAP_NUM
version    $KERNEL_VERSION
machine-id $MACHINE_ID
sort-key   $SNAPSHOT_PREFIX-$(printf "%03d" $SNAP_NUM)
options    $SNAPSHOT_OPTIONS
linux      $LINUX_PATH
initrd     $INITRD_PATH
EOF

    if [ ! -z "$DESCRIPTION" ]; then
        echo "# Description: $DESCRIPTION" >> "$ENTRY_FILE"
    fi
    
    echo -e "${GREEN}✓ Entrée créée: $ENTRY_FILE${NC}"
    COUNT=$((COUNT + 1))
done

echo -e "\n${GREEN}=== Terminé ===${NC}"
echo -e "${GREEN}$COUNT entrée(s) de snapshot créée(s)${NC}"
echo -e "\nVous pouvez maintenant redémarrer et sélectionner un snapshot dans le menu de démarrage."