#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
    amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
    amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function send_notification {
    volume=`get_volume`
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "─" $(($volume / 3)) | sed 's/[0-9]//g')
    # Send the notification
    dunstify -i audio-volume-muted-blocking -t 1000 -r 2593 -u normal "    $bar"
}

case $1 in
    up)
	# Up the volume (+ 5%)
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
	send_notification
	;;
    down)
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
	send_notification
	;;
    mute)
    	# Toggle mute
	wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
	if is_mute ; then
	    dunstify -i audio-volume-muted -t 8 -r 2593 -u normal "Mute"
	else
	    send_notification
	fi
	;;
esac
