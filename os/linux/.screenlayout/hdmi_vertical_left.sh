#!/bin/sh
xrandr \
--output eDP-1 --off \
--output DP-1 --off \
--output HDMI-1 --off \
--output HDMI-2 --primary --mode 1920x1080 --pos 0x0 --rotate left
