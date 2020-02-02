#!/bin/bash

dmode="$(cat /sys/class/drm/card0-VGA-1/status)"

export DISPLAY=:0
export XAUTHORITY=/home/lbolla/.Xauthority

if [ "${dmode}" = disconnected ]
then
     /usr/bin/xrandr --auto
elif [ "${dmode}" = connected ]
then
     /usr/bin/xrandr --output VGA1 --primary --auto --right-of LVDS1
else
    /usr/bin/xrandr --auto
fi

# Restart wm
pkill -1 awesome
