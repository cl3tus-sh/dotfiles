#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

# Source colors
source "$CONFIG_DIR/colors.sh"

# When triggered by aerospace_workspace_change event:
# - $1 is the workspace ID passed as argument in the script config
# - $FOCUSED_WORKSPACE is passed by the event trigger
# - $SENDER will be "aerospace_workspace_change"

# Debug: uncomment to see values
# echo "Script called: NAME=$NAME, arg1=$1, FOCUSED=$FOCUSED_WORKSPACE, SENDER=$SENDER" >> /tmp/aerospace_debug.log

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  # This is the active workspace
  sketchybar --set $NAME \
    background.color=$WORKSPACE_BG_ACTIVE \
    icon.color=$WHITE
else
  # This is an inactive workspace
  sketchybar --set $NAME \
    background.color=$WORKSPACE_BG \
    icon.color=$WHITE
fi
