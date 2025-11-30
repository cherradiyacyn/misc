#!/bin/bash
set -euo pipefail
cat > $HOME/.xprofile <<EOF
#!/bin/bash
setxkbmap -layout fr,ara -variant azerty,azerty -option grp:alt_shift_toggle,caps:swapescape,lv3:lalt_switch,lv3:ralt_alt
(sleep 3 && xinput list --name-only | grep "Touchpad" | while read -r DEVICE; do xinput set-prop "\$DEVICE" "libinput Natural Scrolling Enabled" 1; xinput set-prop "\$DEVICE" "libinput Tapping Enabled" 1; done) &
EOF
chmod +x $HOME/.xprofile
