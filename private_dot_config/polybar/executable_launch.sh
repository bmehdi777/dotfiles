#! /usr/bin/env sh

## Add this to your wm startp file

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# User configuration
## Launch bar 1 & 2
polybar one -c ~/.config/polybar/config.ini &
polybar two -c ~/.config/polybar/config.ini &
