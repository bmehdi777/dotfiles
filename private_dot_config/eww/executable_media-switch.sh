#!/usr/bin/env sh

set -eu

STATE_FILE="$HOME/.config/eww/.media-player"

if ! command -v playerctl >/dev/null 2>&1; then
  exit 0
fi

players="$(playerctl -l 2>/dev/null | awk '!seen[$0]++' || true)"
[ -n "$players" ] || exit 0

count="$(printf '%s\n' "$players" | wc -l | tr -d ' ')"
[ "$count" -gt 1 ] || exit 0

current=""
if [ -f "$STATE_FILE" ]; then
  current="$(sed -n '1p' "$STATE_FILE" 2>/dev/null || true)"
fi

next="$(printf '%s\n' "$players" | awk -v cur="$current" '
  BEGIN { first=""; found=0 }
  {
    if (first == "") first = $0
    if (found == 1) { print $0; exit }
    if ($0 == cur) found = 1
  }
  END {
    if (NR == 0) exit
    if (found == 1) print first
    else print first
  }
')"

[ -n "$next" ] || exit 0
printf '%s\n' "$next" > "$STATE_FILE"
