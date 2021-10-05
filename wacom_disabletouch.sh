#!/bin/bash
# Jeremy Hannan 2014
# Simple script to turn off 'Touch' from Wacom Tablets using xsetwacom
#
# xsetwacom --list devices

touchstring="type: TOUCH"

if $(xsetwacom --list devices | grep "$touchstring" >/dev/null); then
        xsetwacom --set "$(xsetwacom --list devices | grep "type: TOUCH" | awk -F'id:' '{ print $1 }' | sed -e 's/      //' -e 's/ *$//')" Touch off
        echo "Disabled Intuos Touch"
else
        echo "It doesn't look like you have a Intuos Touch tablet"
fi
~  
