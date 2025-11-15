#!/usr/bin/env bash

STATE_FILE="$HOME/.cache/waybar_temp_state"

# init
if [ ! -f "$STATE_FILE" ]; then
  echo "cpu" > "$STATE_FILE"
fi

if [ "$1" = "toggle" ]; then
  if [ "$(cat "$STATE_FILE")" = "cpu" ]; then
    echo "gpu" > "$STATE_FILE"
  else
    echo "cpu" > "$STATE_FILE"
  fi
  exit 0
fi

if [ "$(cat "$STATE_FILE")" = "cpu" ]; then
  TEMP=$(cat /sys/class/hwmon/hwmon4/temp1_input)
  ICON="cpu"
else
  TEMP=$(cat /sys/class/hwmon/hwmon8/temp1_input)
  ICON="gpu"
fi

printf '{"alt":"%s", "text":"%s"}' "$ICON" "$((TEMP / 1000))"
