#!/bin/bash
set -euo pipefail
git config --global --unset user.email
git config --global --unset user.name
git config --global --unset user.editor
git config --global --unset init.defaultBranch
