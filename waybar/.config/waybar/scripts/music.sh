#!/bin/bash

# Spotify only
PLAYER="spotify"

get_title() {
  playerctl -p "$PLAYER" metadata --format "{{ artist }} - {{ title }}" 2>/dev/null
}

is_playing() {
  status=$(playerctl -p "$PLAYER" status 2>/dev/null)
  [ "$status" = "Playing" ] && echo "Playing" && exit 0
  exit 1
}

toggle_play() {
  playerctl -p "$PLAYER" play-pause 2>/dev/null
}

next_track() {
  playerctl -p "$PLAYER" next 2>/dev/null
}

prev_track() {
  playerctl -p "$PLAYER" previous 2>/dev/null
}

get_icon() {
  status=$(playerctl -p "$PLAYER" status 2>/dev/null)
  [ "$status" = "Playing" ] && echo "" || echo ""
}

case "$1" in
  --title) get_title ;;
  --isPlaying) is_playing ;;
  --toggle) toggle_play ;;
  --next) next_track ;;
  --prev) prev_track ;;
  --icon) get_icon ;;
  *) get_title ;;
esac
