#!/usr/bin/env sh

set -eu

STATE_FILE="$HOME/.config/eww/.media-player"
MAX_TITLE_LEN=28

escape_json() {
  printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'
}

truncate_text() {
  input="$1"
  max_len="$2"
  len=$(printf '%s' "$input" | wc -m | tr -d ' ')
  if [ "$len" -le "$max_len" ]; then
    printf '%s' "$input"
  else
    trimmed=$(printf '%s' "$input" | cut -c1-"$max_len")
    printf '%s...' "$trimmed"
  fi
}

if ! command -v playerctl >/dev/null 2>&1; then
  printf '{"available":false,"player":"","status":"Stopped","title":"Install playerctl","display_title":"Install playerctl","artist":"","players":0}\n'
  exit 0
fi

players="$(playerctl -l 2>/dev/null | awk '!seen[$0]++' || true)"

if [ -z "$players" ]; then
  rm -f "$STATE_FILE"
  printf '{"available":false,"player":"","status":"Stopped","title":"No media","display_title":"No media","artist":"","players":0}\n'
  exit 0
fi

player_count="$(printf '%s\n' "$players" | wc -l | tr -d ' ')"

saved_player=""
if [ -f "$STATE_FILE" ]; then
  saved_player="$(sed -n '1p' "$STATE_FILE" 2>/dev/null || true)"
fi

playing_player="$(printf '%s\n' "$players" | while IFS= read -r p; do
  [ -n "$p" ] || continue
  st="$(playerctl -p "$p" status 2>/dev/null || true)"
  if [ "$st" = "Playing" ]; then
    printf '%s\n' "$p"
    break
  fi
done | sed -n '1p')"

if [ -n "$saved_player" ] && printf '%s\n' "$players" | grep -Fxq "$saved_player"; then
  saved_status="$(playerctl -p "$saved_player" status 2>/dev/null || true)"
  if [ -n "$playing_player" ] && [ "$saved_player" != "$playing_player" ] && [ "$saved_status" != "Playing" ]; then
    player="$playing_player"
    printf '%s\n' "$player" > "$STATE_FILE"
  else
    player="$saved_player"
  fi
else
  player="$playing_player"
  [ -n "$player" ] || player="$(printf '%s\n' "$players" | sed -n '1p')"
  printf '%s\n' "$player" > "$STATE_FILE"
fi

status="$(playerctl -p "$player" status 2>/dev/null || printf 'Stopped')"
title="$(playerctl -p "$player" metadata title 2>/dev/null || true)"
artist="$(playerctl -p "$player" metadata artist 2>/dev/null || true)"

[ -n "$title" ] || title="No title"
display_title="$(truncate_text "$title" "$MAX_TITLE_LEN")"

escaped_title="$(escape_json "$title")"
escaped_display_title="$(escape_json "$display_title")"
escaped_artist="$(escape_json "$artist")"
escaped_player="$(escape_json "$player")"
escaped_status="$(escape_json "$status")"

printf '{"available":true,"player":"%s","status":"%s","title":"%s","display_title":"%s","artist":"%s","players":%s}\n' \
  "$escaped_player" "$escaped_status" "$escaped_title" "$escaped_display_title" "$escaped_artist" "$player_count"
