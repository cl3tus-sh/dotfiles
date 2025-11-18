#!/usr/bin/env bash

# This script is triggered by the aerospace_workspace_change event
# It updates all workspace backgrounds based on which one is focused

# Source colors
source "$CONFIG_DIR/colors.sh"

# Get the focused workspace from the label we set in aerospace.toml
FOCUSED=$(sketchybar --query aerospace_workspace_monitor | jq -r '.label.value')

# Debug
echo "$(date) - Workspace change event: FOCUSED=$FOCUSED (from label)" >> /tmp/workspace_change.log

# Get all non-empty workspaces from all monitors
for monitor in $(aerospace list-monitors --format "%{monitor-appkit-nsscreen-screens-id}"); do
  for sid in $(aerospace list-workspaces --monitor "$monitor" --empty no); do
    if [ "$sid" = "$FOCUSED" ]; then
      # This is the active workspace - use active color
      echo "  Setting space.$sid to ACTIVE" >> /tmp/workspace_change.log
      sketchybar --set space.$sid \
        background.color=$WORKSPACE_BG_ACTIVE \
        icon.color=$WHITE
    else
      # This is an inactive workspace - use normal color
      echo "  Setting space.$sid to INACTIVE" >> /tmp/workspace_change.log
      sketchybar --set space.$sid \
        background.color=$WORKSPACE_BG \
        icon.color=$WHITE
    fi
  done
done
