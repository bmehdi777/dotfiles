#!/usr/bin/env sh

set -eu

~/.config/eww/network.sh

nmcli monitor 2>/dev/null | while read -r _; do
  ~/.config/eww/network.sh
done
