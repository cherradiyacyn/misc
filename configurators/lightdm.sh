#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "nope!"
   exit 1
fi
set -euo pipefail
# /etc/pam.d/lightdm
sudo sed -i \
  -e 's/^-auth\s\+optional\s\+pam_gnome_keyring.so/auth       optional pam_gnome_keyring.so/' \
  -e 's/^-session\s\+optional\s\+pam_gnome_keyring.so\s\+auto_start/session    optional pam_gnome_keyring.so auto_start/' \
  /etc/pam.d/lightdm
if ! grep -q "pam_gnome_keyring.so" /etc/pam.d/lightdm; then
    sudo tee -a /etc/pam.d/lightdm > /dev/null << EOF
auth       optional pam_gnome_keyring.so
session    optional pam_gnome_keyring.so auto_start
EOF
fi
# /etc/lightdm/lightdm-gtk-greeter.conf
sudo install -Dm644 "/home/user/Pictures/background.png" "/usr/share/backgrounds/lightdm/lightdm_gtk_greeter_custom_bg.png"
grep -q "^background=/usr/share/backgrounds/lightdm/lightdm_gtk_greeter_custom_bg.png" "/etc/lightdm/lightdm-gtk-greeter.conf" || \
sudo tee -a "/etc/lightdm/lightdm-gtk-greeter.conf" > /dev/null <<EOF
[greeter]
background=/usr/share/backgrounds/lightdm/lightdm_gtk_greeter_custom_bg.png
EOF
