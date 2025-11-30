#!/bin/bash
set -euo pipefail
sed -i '/# START_ALIAS_BLOCK/,/# END_ALIAS_BLOCK/d' $HOME/.bashrc
