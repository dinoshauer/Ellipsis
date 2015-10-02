#!/bin/bash

IN="eDP1"
EXT="DP2-2"

if (xrandr | grep "$EXT disconnected"); then
    xrandr --output $IN --auto --output $EXT --off
else
    xrandr --output $IN --auto --primary --output $EXT --auto --right-of $IN
fi

setxkbmap dk &
xsetroot -cursor_name left_ptr &
feh --bg-scale `ls /home/k/git/ellipsis/wallpapers/*.jpg | sort -R | tail -n 1` &
sxhkd -f 100 -c /home/k/.config/sxhkd/sxhkdrc &
dunst &
synclient MaxTapTime=0 &
synclient MaxDoubleTapTime=0 &
pulseaudio --start --log-target=syslog &

# Set the default sink to laptop speakers if dock is disconnected
if (xrandr | grep "$EXT disconnected"); then
    pacmd set-default-sink 1 &
else
    pacmd set-default-sink 2 &
fi

exec bspwm
