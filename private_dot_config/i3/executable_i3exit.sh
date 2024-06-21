#!/usr/bin/env sh

function lock {
	betterlockscreen -l
}

case "$1" in
    lock)
        betterlockscreen -l
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        lock && systemctl suspend
        ;;
    reboot)
        systemctl reboot
        ;;
    poweroff)
        shutdown now
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|reboot|poweroff}"
        exit 2
esac

exit 0
