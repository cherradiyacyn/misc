#!/bin/bash
set -euo pipefail
PLUGINS=(battery xkb pulseaudio)
declare -A PLUGIN_IDS
LOG_FILE="$HOME/Logs/my-plugin-ids"
mkdir -p "$(dirname "$LOG_FILE")"
> "$LOG_FILE"
# add
for PLUGIN in "${PLUGINS[@]}"; do
    xfce4-panel --add="$PLUGIN"
    PLUGIN_IDS["$PLUGIN"]=$(xfconf-query -c xfce4-panel -p /plugins -lv 2>/dev/null | awk -v p="$PLUGIN" '$2 == p {print $1}' | sed -n 's/.*plugin-\([0-9]\+\).*/\1/p' | tail -n 1)
done
# xkb
XKB_ID="${PLUGIN_IDS[xkb]}"
xfconf-query -c xfce4-panel -p /plugins/plugin-$XKB_ID/display-type -n -t int -s 2
xfconf-query -c xfce4-panel -p /plugins/plugin-$XKB_ID/display-name -n -t int -s 1
xfconf-query -c xfce4-panel -p /plugins/plugin-$XKB_ID/display-tooltip-icon -n -t bool -s false
xfconf-query -c xfce4-panel -p /plugins/plugin-$XKB_ID/group-policy -n -t int -s 0
# reload
xfce4-panel -r
# log
for PLUGIN in "${!PLUGIN_IDS[@]}"; do
    echo "${PLUGIN_IDS[$PLUGIN]}" >> $LOG_FILE
done
# opt
xfconf-query -c xfce4-panel -p /panels/panel-1/plugin-ids -lv
xfconf-query -c xfce4-panel -p /plugins -lv | grep -E 'battery|xkb|pulseaudio'
