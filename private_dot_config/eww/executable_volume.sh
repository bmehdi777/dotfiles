#!/usr/bin/env sh

set -eu

muted="$(LC_ALL=C pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | awk '{print ($2 == "yes") ? "true" : "false"; exit}')"
vol="$(LC_ALL=C pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | awk -F'/' 'NR==1 { gsub(/[ %]/, "", $2); print $2 + 0; exit }')"

printf '{"vol":%s,"muted":%s}\n' "${vol:-0}" "${muted:-false}"
