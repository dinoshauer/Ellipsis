#!/bin/bash

hsetroot -fill /home/k/git/ellipsis/wallpapers/iso-squares-03.jpg &
sxhkd -c /home/k/.config/sxhkd/sxhkdrc &
compton --config git/ellipsis/.config/compton/.compton.conf &

exec bspwm
