#!/usr/bin/env sh

set -eu

LOCK_DIR="${XDG_RUNTIME_DIR:-/tmp}/eww-monitor-watch.lock"

if ! mkdir "$LOCK_DIR" 2>/dev/null; then
  exit 0
fi

cleanup() {
  rmdir "$LOCK_DIR"
}

trap cleanup EXIT INT TERM

last_state=""

while :; do
  current_state="$(xrandr --query | awk '/ connected/{print $1}' | tr '\n' ' ')"

  if [ "$current_state" != "$last_state" ]; then
    ~/.config/eww/open-bars.sh
    last_state="$current_state"
  fi

  sleep 2
done
