#!/usr/bin/env sh

set -eu

~/.config/eww/volume.sh

pactl subscribe 2>/dev/null | while read -r line; do
  case "$line" in
    *"on sink"*) ~/.config/eww/volume.sh ;;
  esac
done
