#!/bin/bash
set -euo pipefail
xfconf-query -c xfce4-keyboard-shortcuts -l | while read line; do
    xfconf-query -rR -c xfce4-keyboard-shortcuts -p "$line"
done
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/override" -n -t bool -s "true"
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/override" -n -t bool -s "true"
