#!/bin/bash

DEFAULT_NAME="spotify"
MAX_CHARS=30
LABEL_FILE="/tmp/sketchybar_spotify_label"

PLAYING_COLOR=0xffa6da95
PAUSED_COLOR=0xffffa217

MAIN_PLAYING_ICON=󱑽
MAIN_PAUSED_ICON=󰐎

PLAYER_PLAYING_ICON=󰏤
PLAYER_PAUSED_ICON=

update_playpause_icon() {
  case "$PLAYER_STATE" in
    "playing"|"Playing")
      ICON=$PLAYER_PLAYING_ICON
      ;;
    *)
      ICON=$PLAYER_PAUSED_ICON
      ;;
  esac

  sketchybar --set "$DEFAULT_NAME.playpause" icon=$ICON
}

truncate_label() {
  FULL_LABEL=$(cat "$LABEL_FILE" 2>/dev/null)
  [ -z "$FULL_LABEL" ] && return

  if [ ${#FULL_LABEL} -le "$MAX_CHARS" ]; then
    sketchybar --set $DEFAULT_NAME label="$FULL_LABEL"
  else
    sketchybar --set $DEFAULT_NAME label="${FULL_LABEL:0:$((MAX_CHARS - 3))}..."
  fi
}

update_track() {
  SPOTIFY_JSON="$INFO"

  if [[ ! -z $SPOTIFY_JSON ]]; then
    PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '.["Player State"]')
    TRACK="$(echo "$SPOTIFY_JSON" | jq -r .Name)"
    ARTIST="$(echo "$SPOTIFY_JSON" | jq -r .Artist)"
    FULL_LABEL="${ARTIST} - ${TRACK}"

    echo "$FULL_LABEL" > "$LABEL_FILE"

    update_playpause_icon

    if [ "$PLAYER_STATE" = "Playing" ]; then
      ICON=$MAIN_PLAYING_ICON
      COLOR=$PLAYING_COLOR
    else
      ICON=$MAIN_PAUSED_ICON
      COLOR=$PAUSED_COLOR
    fi

    if [ ${#FULL_LABEL} -le $MAX_CHARS ]; then
      sketchybar --set $NAME label="$FULL_LABEL" icon=$ICON icon.color=$COLOR
    else
      sketchybar --set $NAME label="${FULL_LABEL:0:$((MAX_CHARS - 3))}..." icon=$ICON icon.color=$COLOR
    fi
  else
    sketchybar --set $NAME \
      label="Unknown" \
      icon=$MAIN_PAUSED_ICON icon.color=$PAUSED_COLOR
  fi
}

mouse_clicked() {
  case "$NAME" in
    "$DEFAULT_NAME")
      open -a Spotify
      ;;
    "$DEFAULT_NAME.next")
      osascript -e 'tell application "Spotify" to play next track'
      ;;
    "$DEFAULT_NAME.playpause")
      osascript -e 'tell application "Spotify" to playpause'

      PLAYER_STATE=$(osascript -e 'tell application "Spotify" to player state')
      update_playpause_icon
      ;;
    "$DEFAULT_NAME.back")
      osascript -e 'tell application "Spotify" to play previous track'
      ;;
  esac
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "routine")
    truncate_label
  ;;
  *)
    if [[ "$NAME" = "$DEFAULT_NAME" ]]; then
      update_track
    fi
    ;;
esac
