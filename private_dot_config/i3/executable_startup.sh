#!/usr/bin/env sh

autorandr --force 2> /dev/null 1> /dev/null
#pkill picom > /dev/null || picom -b &

sh ~/.fehbg &
xset r rate 400 50 &
xset -dpms &
xset s off

