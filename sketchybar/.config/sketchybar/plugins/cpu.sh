#!/bin/sh

CPU=$(top -l 1 -n 0 | awk '/CPU usage/ {gsub(/%/,"",$3); printf "%.0f", $3}')

sketchybar --set "$NAME" icon="󰍛" label="${CPU}%"
