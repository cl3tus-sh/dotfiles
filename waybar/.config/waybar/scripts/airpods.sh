#!/bin/bash

# Remplace "AirPods Pro" par le nom exact dans bluetoothctl devices ou info
NAME="AirPods Pro"

# Vérifie si l'appareil est connecté
if bluetoothctl info | grep -q "Name: $NAME"; then
    if bluetoothctl info | grep -q "Connected: yes"; then
        # Module visible
        echo '{"text":"󱡒","tooltip":"AirPods connected","class":"airpods-on"}'
        exit 0
    fi
fi

# Module caché
echo '{"text":""}'
exit 0
