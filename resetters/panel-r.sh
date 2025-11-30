#!/bin/bash
set -euo pipefail
LOG_FILE="$HOME/Logs/my-plugin-ids"
if [ ! -s "$LOG_FILE" ]; then
    echo "nope!"
    exit 1
fi
# prepare
xfconf-query -c xfce4-panel -p /panels/panel-1/plugin-ids -lv | grep -o '\[.*\]' | tr -d '[]' | tr ',' '\n' | sort > /tmp/xfce_panel_current_ids.txt
sort "$LOG_FILE" > /tmp/xfce_panel_ids_to_remove.txt
comm -23 /tmp/xfce_panel_current_ids.txt /tmp/xfce_panel_ids_to_remove.txt > /tmp/xfce_panel_remaining_ids.txt
sort -n -o /tmp/xfce_panel_remaining_ids.txt /tmp/xfce_panel_remaining_ids.txt
# remove
while IFS= read -r id; do
    xfconf-query -rR -c xfce4-panel -p /plugins/plugin-"$id"
done < "/tmp/xfce_panel_ids_to_remove.txt"
# update
xfconf-query -rR -c xfce4-panel -p /panels/panel-1/plugin-ids
cmd=(xfconf-query -c xfce4-panel -p /panels/panel-1/plugin-ids)
while IFS= read -r id; do
    cmd+=(-n -t int -s "$id")
done < "/tmp/xfce_panel_remaining_ids.txt"
"${cmd[@]}"
# reload
xfce4-panel -r
# log
> "$LOG_FILE"
# opt
xfconf-query -c xfce4-panel -p /panels/panel-1/plugin-ids -lv
xfconf-query -c xfce4-panel -p /plugins -lv | grep -E 'battery|xkb|pulseaudio'
