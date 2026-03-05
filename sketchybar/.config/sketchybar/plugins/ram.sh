#!/bin/sh

FREE=$(memory_pressure | awk '/free percentage/ {gsub(/%/,"",$5); print $5}')
USED=$((100 - FREE))

sketchybar --set "$NAME" icon="" label="${USED}%"
