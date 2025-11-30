#!/bin/bash
set -euo pipefail
ssh-add -d "$HOME/.ssh/id_ed25519" > /dev/null 2>&1 || true
rm -f "$HOME/.ssh/id_ed25519" "$HOME/.ssh/id_ed25519.pub"
