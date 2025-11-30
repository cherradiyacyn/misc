#!/bin/bash
set -euo pipefail
CONNECTED_MONITORS=$(xrandr --query | awk '/ connected/ {print $1}')
for MONITOR_NAME in $CONNECTED_MONITORS; do
    xfconf-query -rR -c xfce4-desktop -p "/backdrop/screen0/monitor$MONITOR_NAME/workspace0/last-image"
    xfconf-query -rR -c xfce4-desktop -p "/backdrop/screen0/monitor$MONITOR_NAME/workspace0/image-style"
done
