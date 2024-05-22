#! /usr/bin/env sh

## Add this to your wm startp file

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# User configuration
#
# detect layout
SCREENLAYOUT=$(autorandr --detected 2>/dev/null)
SCREENNAMES=$(autorandr --fingerprint 2>/dev/null | awk '{print $1}')

case $SCREENLAYOUT in
	"triple_work")
		triple_work()
		;;
	"double_work")
		double_work()
		;;
	"single")
		single()
		;;
	"triple_home")
		triple_home()
		;;
esac


triple_work() {
	export DISPLAY_THREE=$(echo $SCREENNAMES | awk 'NR==3 {print}')
	export EXTERNAL_MONITOR_1=$(echo $SCREENNAMES | awk 'NR==1 {print}')
	export EXTERNAL_MONITOR_2=$(echo $SCREENNAMES | awk 'NR==2 {print}')

	export DISPLAY_ONE=$()
	polybar triple_work_one -c ~/.config/polybar/config.ini &
	polybar triple_work_two -c ~/.config/polybar/config.ini &
	polybar triple_work_three -c ~/.config/polybar/config.ini &
}
double_work() {
	polybar double_work_one -c ~/.config/polybar/config.ini &
	polybar double_work_two -c ~/.config/polybar/config.ini &
}
single() {
	export DISPLAY_ONE=$(echo $SCREENNAMES)
	polybar single -c ~/.config/polybar/config.ini &
}
triple_home() {
	polybar triple_home_one -c ~/.config/polybar/config.ini &
	polybar triple_home_two -c ~/.config/polybar/config.ini &
	polybar triple_home_three -c ~/.config/polybar/config.ini &
}

