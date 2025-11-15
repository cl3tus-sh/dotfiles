#!/bin/bash

# Si Spotify tourne, ne rien afficher
if pgrep -x "spotify" >/dev/null; then
  echo ""
else
  # Sinon afficher l'icône Spotify
  echo ""
fi