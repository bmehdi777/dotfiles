#!/usr/bin/env sh

set -eu

eww daemon
eww update wsmap="$(~/.config/eww/workspaces.sh)"

for id in $(eww active-windows | awk -F': ' '$2 == "bar" { print $1 }'); do
  eww close "$id"
done

xrandr --query | awk '/ connected/{print $1}' | while IFS= read -r monitor; do
  [ -n "$monitor" ] || continue
  bar_id="bar-$(printf '%s' "$monitor" | tr -c 'A-Za-z0-9_-' '_')"
  eww open bar --id "$bar_id" --arg monitor="$monitor"
done
