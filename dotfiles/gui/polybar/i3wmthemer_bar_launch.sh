#!/bin/env sh

pkill polybar

sleep 1;

# Tell polybar about network interfaces
export ETHERNET_INTERFACE=$(ip l | grep ' en' | sed -e 's/://g'  | awk '{print $2}')
export WLAN_INTERFACE=$(ip l | grep ' wl' | sed -e 's/://g'  | awk '{print $2}')

for MONITOR in $(xrandr -q | grep " connected" | cut -d ' ' -f1)
do
    env MONITOR="$MONITOR" polybar master &
done
