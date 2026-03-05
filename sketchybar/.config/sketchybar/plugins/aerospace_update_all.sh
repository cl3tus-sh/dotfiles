#!/usr/bin/env bash

CONFIG_DIR="$HOME/.config/sketchybar"

# Source colors
source "$CONFIG_DIR/colors.sh"

# Get the focused workspace
FOCUSED=$(/usr/local/bin/aerospace list-workspaces --focused)

# Update all 9 workspaces directly
for sid in {1..9}; do
  if [ "$sid" = "$FOCUSED" ]; then
    # Active workspace - bordure colorée + icône accent
    sketchybar --set space.$sid \
      background.border_color=$WORKSPACE_BORDER_ACTIVE \
      icon.color=$WORKSPACE_ICON_ACTIVE
  else
    # Inactive workspace - bordure subtile + icône dim
    sketchybar --set space.$sid \
      background.border_color=$WORKSPACE_BORDER_COLOR \
      icon.color=$WORKSPACE_ICON_COLOR
  fi
done
