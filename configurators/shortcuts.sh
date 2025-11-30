#!/bin/bash
set -euo pipefail

if (( $(xfconf-query -c xfce4-keyboard-shortcuts -l 2>/dev/null | grep -E '/(commands|xfwm4)/custom/' | wc -l) != 2 )); then
    echo "nope!"
    exit 1
fi

if ! xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/override" &>/dev/null || \
   ! xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/override" &>/dev/null; then
    echo "nope!"
    exit 1
fi

declare -A SHORTCUTS=(
    ["/commands/custom/<Primary><Alt>e"]="exo-open --launch FileManager"
    ["/commands/custom/<Primary><Alt>Escape"]="xfce4-taskmanager"
    ["/commands/custom/<Primary><Alt>f"]="xfce4-appfinder"
    ["/commands/custom/<Primary><Alt>s"]="exo-open --launch WebBrowser"
    ["/commands/custom/<Primary><Alt>t"]="exo-open --launch TerminalEmulator"
    ["/commands/custom/<Primary><Alt>z"]="subl"
    ["/commands/custom/Print"]="xfce4-screenshooter"
    ["/commands/custom/<Super>comma"]="xflock4"
    ["/commands/custom/<Super>m"]="xfce4-session-logout"
    ["/xfwm4/custom/<Alt>Tab"]="cycle_windows_key"
    ["/xfwm4/custom/<Primary><Alt>d"]="show_desktop_key"
    ["/xfwm4/custom/<Primary><Alt>q"]="close_window_key"
    ["/xfwm4/custom/Down"]="down_key"
    ["/xfwm4/custom/Escape"]="cancel_key"
    ["/xfwm4/custom/Left"]="left_key"
    ["/xfwm4/custom/Right"]="right_key"
    ["/xfwm4/custom/<Super>i"]="tile_down_right_key"
    ["/xfwm4/custom/<Super>j"]="tile_left_key"
    ["/xfwm4/custom/<Super>k"]="prev_workspace_key"
    ["/xfwm4/custom/<Super>l"]="next_workspace_key"
    ["/xfwm4/custom/<Super>o"]="maximize_window_key"
    ["/xfwm4/custom/<Super>p"]="tile_right_key"
    ["/xfwm4/custom/Up"]="up_key"
)

for PROPERTY in "${!SHORTCUTS[@]}"; do
    xfconf-query -c xfce4-keyboard-shortcuts -p "$PROPERTY" -n -t string -s "${SHORTCUTS[$PROPERTY]}"
done
