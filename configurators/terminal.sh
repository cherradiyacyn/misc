#!/bin/bash
set -euo pipefail
xfconf-query -c xfce4-terminal -p /background-mode -n -t string -s TERMINAL_BACKGROUND_TRANSPARENT
xfconf-query -c xfce4-terminal -p /background-darkness -n -t double -s 0.75
xfconf-query -c xfce4-terminal -p /font-name -n -t string -s "Iosevka Term 16"
xfconf-query -c xfce4-terminal -p /title-mode -n -t string -s TERMINAL_TITLE_HIDE
