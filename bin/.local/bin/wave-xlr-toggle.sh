#!/bin/bash

SOURCE="alsa_input.usb-Elgato_Systems_Elgato_Wave_XLR_DS25L3A01231-00.mono-fallback"

STATE=$(pactl get-source-mute "$SOURCE" | awk '{print $2}')

if [ "$STATE" = "yes" ]; then
    pactl set-source-mute "$SOURCE" 0
else
    pactl set-source-mute "$SOURCE" 1
fi