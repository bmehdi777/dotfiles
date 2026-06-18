#!/usr/bin/env sh

set -eu

line="$(nmcli -t -f TYPE,STATE,CONNECTION device status 2>/dev/null \
  | awk -F: '$2 == "connected" && $1 != "loopback" { print; exit }')"

if [ -z "$line" ]; then
  printf '{"type":"down","name":"","up":false}\n'
  exit 0
fi

raw_type="$(printf '%s' "$line" | cut -d: -f1)"
name="$(printf '%s' "$line" | cut -d: -f3- | sed 's/\\/\\\\/g; s/"/\\"/g')"

case "$raw_type" in
  *wireless*|wifi) type="wifi" ;;
  *ethernet*) type="ethernet" ;;
  *) type="other" ;;
esac

printf '{"type":"%s","name":"%s","up":true}\n' "$type" "$name"
