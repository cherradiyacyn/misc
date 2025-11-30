#!/bin/bash
set -euo pipefail
thunar -q
cat > $HOME/.config/Thunar/accels.scm << EOF
(gtk_accel_path "<Actions>/ThunarWindow/open-parent" "<Primary>Up")
(gtk_accel_path "<Actions>/ThunarStandardView/forward" "<Primary>Right")
(gtk_accel_path "<Actions>/ThunarStandardView/back" "<Primary>Left")
(gtk_accel_path "<Actions>/ThunarWindow/open-home" "<Primary>Down")
EOF
