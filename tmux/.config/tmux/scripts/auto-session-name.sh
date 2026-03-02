#!/bin/bash

dir_name=$(basename "$PWD")
base_name="$dir_name"
counter=1

# Check si le nom existe déjà (autre que session courante)
while tmux list-sessions -F '#S' 2>/dev/null | grep -qx "$dir_name"; do
  dir_name="${base_name}-${counter}"
  ((counter++))
done

tmux rename-session "$dir_name" 2>/dev/null
