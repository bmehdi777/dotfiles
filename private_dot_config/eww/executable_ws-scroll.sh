#!/usr/bin/env sh

set -eu

monitor="${1:-}"
direction="${2:-}"

[ -n "$monitor" ] || exit 0

ws_json="$(i3-msg -t get_workspaces)"

# Workspace names on this output, in i3 order.
names="$(printf '%s' "$ws_json" | jq -r --arg o "$monitor" '.[] | select(.output == $o) | .name')"
# Currently visible workspace on this output.
current="$(printf '%s' "$ws_json" | jq -r --arg o "$monitor" '[.[] | select(.output == $o and .visible) | .name][0] // empty')"

target="$(printf '%s\n' "$names" | awk -v cur="$current" -v dir="$direction" '
  NF { a[++n] = $0; if ($0 == cur) idx = n }
  END {
    if (n == 0) exit;
    if (idx == 0) { print a[1]; exit }
    if (dir == "up") t = idx - 1; else t = idx + 1;
    if (t < 1) t = n;
    if (t > n) t = 1;
    print a[t];
  }')"

[ -n "$target" ] && i3-msg workspace "$target" >/dev/null 2>&1 || true
