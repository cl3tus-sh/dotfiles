#!/bin/bash

# Icons for different states
ICON_PLAYING="󰎈"
ICON_PAUSED="󰏥"
ICON_STOPPED=""

# Function to get Music.app info
get_music_info() {
  state=$(osascript -e 'tell application "Music" to player state as string' 2>/dev/null)

  if [ "$state" = "playing" ]; then
    artist=$(osascript -e 'tell application "Music" to artist of current track as string' 2>/dev/null)
    title=$(osascript -e 'tell application "Music" to name of current track as string' 2>/dev/null)
    echo "playing|$artist|$title|Music"
  elif [ "$state" = "paused" ]; then
    artist=$(osascript -e 'tell application "Music" to artist of current track as string' 2>/dev/null)
    title=$(osascript -e 'tell application "Music" to name of current track as string' 2>/dev/null)
    echo "paused|$artist|$title|Music"
  else
    echo "stopped|||Music"
  fi
}

# Function to get Spotify info
get_spotify_info() {
  state=$(osascript -e 'tell application "Spotify" to player state as string' 2>/dev/null)

  if [ "$state" = "playing" ]; then
    artist=$(osascript -e 'tell application "Spotify" to artist of current track as string' 2>/dev/null)
    title=$(osascript -e 'tell application "Spotify" to name of current track as string' 2>/dev/null)
    echo "playing|$artist|$title|Spotify"
  elif [ "$state" = "paused" ]; then
    artist=$(osascript -e 'tell application "Spotify" to artist of current track as string' 2>/dev/null)
    title=$(osascript -e 'tell application "Spotify" to name of current track as string' 2>/dev/null)
    echo "paused|$artist|$title|Spotify"
  else
    echo "stopped|||Spotify"
  fi
}

# Check which app is playing
INFO=""

# Check if Spotify is running and playing
if pgrep -x "Spotify" > /dev/null; then
  spotify_info=$(get_spotify_info)
  if [[ $spotify_info == playing* ]]; then
    INFO="$spotify_info"
  fi
fi

# If Spotify is not playing, check Music.app
if [ -z "$INFO" ] && pgrep -x "Music" > /dev/null; then
  music_info=$(get_music_info)
  if [[ $music_info == playing* ]]; then
    INFO="$music_info"
  fi
fi

# If nothing is playing, check for paused content
if [ -z "$INFO" ]; then
  if pgrep -x "Spotify" > /dev/null; then
    spotify_info=$(get_spotify_info)
    if [[ $spotify_info == paused* ]]; then
      INFO="$spotify_info"
    fi
  fi

  if [ -z "$INFO" ] && pgrep -x "Music" > /dev/null; then
    music_info=$(get_music_info)
    if [[ $music_info == paused* ]]; then
      INFO="$music_info"
    fi
  fi
fi

# Parse the info and update sketchybar
if [ -n "$INFO" ]; then
  IFS='|' read -r state artist title app <<< "$INFO"

  if [ "$state" = "playing" ]; then
    ICON="$ICON_PLAYING"
  elif [ "$state" = "paused" ]; then
    ICON="$ICON_PAUSED"
  else
    ICON="$ICON_STOPPED"
  fi

  # Truncate the label if too long
  MAX_LENGTH=40
  LABEL="$artist - $title"
  if [ ${#LABEL} -gt $MAX_LENGTH ]; then
    LABEL="${LABEL:0:$MAX_LENGTH}..."
  fi

  sketchybar --set "$NAME" icon="$ICON" label="$LABEL" drawing=on
else
  # Nothing playing, hide the item
  sketchybar --set "$NAME" drawing=off
fi
