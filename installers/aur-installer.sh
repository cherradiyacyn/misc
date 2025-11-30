#!/bin/bash
set -euo pipefail
AUR_PACKAGES=(
    "brave-bin"
    "gpu-screen-recorder"
    "gpu-screen-recorder-gtk"
    "lingot"
    "timeshift-autosnap"
    "turbowarp-desktop-bin"
    "vmware-keymaps"
    "vmware-workstation"
)
cd /tmp/
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si --noconfirm
cd /tmp/
rm -rf yay/
yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"
