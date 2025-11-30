#!/bin/bash
set -euo pipefail
rm -f $HOME/.config/fontconfig/fonts.conf
rm -f $HOME/.config/fontconfig/conf.d/66-noto-reject-nastaliq.conf
fc-cache -fv
