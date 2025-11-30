#!/bin/bash
set -euo pipefail
xfconf-query -c xfwm4 -p /general/margin_top -n -t int -s 46
xfconf-query -c xfwm4 -p /general/margin_left -n -t int -s 20
xfconf-query -c xfwm4 -p /general/margin_right -n -t int -s 20
xfconf-query -c xfwm4 -p /general/margin_bottom -n -t int -s 20
