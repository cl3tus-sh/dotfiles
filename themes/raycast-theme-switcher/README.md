# Theme Switcher

Extension Raycast pour changer de thème système avec prévisualisation du wallpaper.

## Installation permanente

1. Installer les dépendances :
   ```bash
   npm install
   ```

2. Builder et installer l'extension :
   ```bash
   npm run build
   ```

3. Dans Raycast, chercher "Switch Theme"

## Après modification du code

Si vous modifiez le code de l'extension, relancez simplement :
```bash
npm run build
```

## Mode développement

Pour développer avec hot reload :
```bash
npm run dev
```

## Utilisation

- Ouvrir Raycast et taper "Switch Theme"
- Parcourir les thèmes disponibles avec preview du wallpaper
- Appuyer sur Entrée pour changer de thème
- Cmd+C pour copier le chemin du wallpaper
- Cmd+Shift+F pour ouvrir le dossier du thème dans Finder

## Structure

L'extension lit les thèmes depuis `~/.config/themes/` et exécute le script `~/.local/bin/set-theme` pour appliquer le thème sélectionné.

Chaque thème doit avoir un fichier `theme.json` avec la structure suivante :

```json
{
  "name": "theme-name",
  "wallpaper": "./wallpaper.jpg",
  "wallpaper_blurred": "./wallpaper_blurred.jpg"
}
```
