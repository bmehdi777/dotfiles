#!/usr/bin/env sh

set -eu

monitor="${1:-}"

if [ -z "$monitor" ]; then
  focused="$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused) | .output' 2>/dev/null || true)"
  monitor="$focused"
fi

[ -n "$monitor" ] || exit 0

popup_id="media-popup-global"

if eww active-windows | awk -F': ' -v id="$popup_id" '$1 == id { found=1 } END { exit(found ? 0 : 1) }'; then
  eww close "$popup_id"
else
  eww active-windows | awk -F': ' '$1 ~ /^media-popup-/ { print $1 }' | while IFS= read -r wid; do
    [ -n "$wid" ] || continue
    eww close "$wid"
  done
  eww open media-popup --id "$popup_id" --arg monitor="$monitor"
fi
