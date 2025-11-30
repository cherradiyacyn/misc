#!/bin/bash
set -euo pipefail
xfconf-query -rR -c xfwm4 -p /general/margin_top
xfconf-query -rR -c xfwm4 -p /general/margin_left
xfconf-query -rR -c xfwm4 -p /general/margin_right
xfconf-query -rR -c xfwm4 -p /general/margin_bottom
