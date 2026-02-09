#!/usr/bin/env bash

CONFIG_DIR="$HOME/.config/sketchybar"

# Source colors
source "$CONFIG_DIR/colors.sh"

# Get the focused workspace
FOCUSED=$(/usr/local/bin/aerospace list-workspaces --focused)

# Update all 9 workspaces directly
for sid in {1..9}; do
  if [ "$sid" = "$FOCUSED" ]; then
    # Active workspace
    sketchybar --set space.$sid \
      background.color=$WORKSPACE_BG_ACTIVE \
      icon.color=$WHITE
  else
    # Inactive workspace
    sketchybar --set space.$sid \
      background.color=$WORKSPACE_BG \
      icon.color=$WHITE
  fi
done
