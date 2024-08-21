#!/usr/bin/env bash

STEP=5

set_brightness() {
	CUR_OUTPUT=$(i3-msg -t get_workspaces | jq 'map(select(.focused == true))[]?.output' | tr -d '"')
	CUR_BRIGHTNESS=$(xrandr --verbose --current | grep ^"$CUR_OUTPUT" -A5 | tail -n1 | awk '{print $2}')

	LEFT=${CUR_BRIGHTNESS%%"."*}
	RIGHT=${CUR_BRIGHTNESS#*"."}
	MATH_BRIGHT="0"

	[[ "$LEFT" != 0 && "$STEP" -lt 10 ]] && STEP=10
	[[ "$LEFT" != 0 ]] && MATH_BRIGHT="$LEFT"00
	[[ "${#RIGHT}" -eq 1 ]] && RIGHT="$RIGHT"0
	MATH_BRIGHT=$(( MATH_BRIGHT + RIGHT ))

	[[ "$1" == "up" ]] && MATH_BRIGHT=$(( MATH_BRIGHT + STEP ))
	[[ "$1" == "down" ]] && MATH_BRIGHT=$(( MATH_BRIGHT - STEP ))
	[[ "$1" == "reset" ]] && MATH_BRIGHT=$(( 100 ))
	[[ "${MATH_BRIGHT:0:1}" == "-" ]] && MATH_BRIGHT=0    
	[[ "$MATH_BRIGHT" -gt 100  ]] && MATH_BRIGHT=100      # Can't go over 1

	if [[ "${#MATH_BRIGHT}" -eq 3 ]] ; then
    MATH_BRIGHT="$MATH_BRIGHT"000         
    CUR_BRIGHTNESS="${MATH_BRIGHT:0:1}.${MATH_BRIGHT:1:2}"
	else
    MATH_BRIGHT="$MATH_BRIGHT"000        
    CUR_BRIGHTNESS=".${MATH_BRIGHT:0:2}"
	fi

	xrandr --output $CUR_OUTPUT --brightness $CUR_BRIGHTNESS
}

case "$1" in
	up)
		set_brightness up
		;;
	down)
		set_brightness down
		;;
	reset)
		set_brightness reset
		;;

	*)
		echo "Usage: $0 {up|down|reset}"
		exit 2
esac

exit 0