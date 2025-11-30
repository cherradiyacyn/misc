#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "nope!"
   exit 1
fi
set -euo pipefail
sudo systemctl disable --now vmware-networks.service
sudo systemctl disable --now vmware-usbarbitrator.service
sudo modprobe -r vmnet vmw_vmci vmmon || true
