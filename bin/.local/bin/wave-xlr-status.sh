#!/bin/bash

SOURCE="alsa_input.usb-Elgato_Systems_Elgato_Wave_XLR_DS25L3A01231-00.mono-fallback"

STATE=$(pactl get-source-mute "$SOURCE" | awk '{print $2}')

if [ "$STATE" = "yes" ]; then
    ICON="muted"
else
    ICON="unmuted"
fi

printf '{"alt":"%s","class":"%s"}' "$ICON" "$ICON"
