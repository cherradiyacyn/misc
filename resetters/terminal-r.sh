#!/bin/bash
set -euo pipefail
xfconf-query -rR -c xfce4-terminal -p /background-mode
xfconf-query -rR -c xfce4-terminal -p /background-darkness
xfconf-query -rR -c xfce4-terminal -p /font-name
xfconf-query -rR -c xfce4-terminal -p /title-mode
