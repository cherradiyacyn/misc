#!/bin/bash
set -euo pipefail
CONNECTED_MONITORS=$(xrandr --query | awk '/ connected/ {print $1}')
for MONITOR_NAME in $CONNECTED_MONITORS; do
    xfconf-query -c xfce4-desktop -p "/backdrop/screen0/monitor$MONITOR_NAME/workspace0/last-image" -n -t string -s "$HOME/Pictures/background.png"
    xfconf-query -c xfce4-desktop -p "/backdrop/screen0/monitor$MONITOR_NAME/workspace0/image-style" -n -t int -s 3
done
