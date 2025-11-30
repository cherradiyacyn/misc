#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "nope!"
   exit 1
fi
set -euo pipefail
# /etc/pam.d/lightdm
sudo sed -i \
  -e 's/auth\s\+optional\s\+pam_gnome_keyring.so/-auth       optional pam_gnome_keyring.so/' \
  -e 's/session\s\+optional\s\+pam_gnome_keyring.so\s\+auto_start/-session    optional pam_gnome_keyring.so auto_start/' \
  /etc/pam.d/lightdm
# /etc/lightdm/lightdm-gtk-greeter.conf
sudo rm -f /usr/share/backgrounds/lightdm/lightdm_gtk_greeter_custom_bg.png
if [ -f "/etc/lightdm/lightdm-gtk-greeter.conf" ]; then
    sudo sed -i '/^background=\/usr\/share\/backgrounds\/lightdm\/lightdm_gtk_greeter_custom_bg.png/d' "/etc/lightdm/lightdm-gtk-greeter.conf"
    sudo sed -i '/^\[greeter\]/d' "/etc/lightdm/lightdm-gtk-greeter.conf"
fi
