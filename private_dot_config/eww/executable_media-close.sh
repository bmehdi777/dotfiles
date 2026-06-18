#!/usr/bin/env sh

set -eu

eww active-windows | awk -F': ' '$2 == "media-popup" { print $1 }' | while IFS= read -r wid; do
  [ -n "$wid" ] || continue
  eww close "$wid"
done
