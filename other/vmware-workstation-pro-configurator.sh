#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "nope!"
   exit 1
fi
set -euo pipefail
sudo modprobe -a vmmon vmw_vmci vmnet
sudo systemctl enable --now vmware-networks.service
sudo systemctl enable --now vmware-usbarbitrator.service
