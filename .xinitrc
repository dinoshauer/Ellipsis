#!/bin/bash

IN="eDP-0"
EXT="HDMI-0"

if (xrandr | grep "$EXT disconnected"); then
    xrandr --output $IN --auto --output $EXT --off
else
    xrandr --output $IN --auto --primary --output $EXT --auto --right-of $IN
fi

hsetroot -fill /home/k/git/ellipsis/wallpapers/iso-squares-03.jpg &
sxhkd -c /home/k/.config/sxhkd/sxhkdrc &
compton --config git/ellipsis/.config/compton/.compton.conf &

exec bspwm
