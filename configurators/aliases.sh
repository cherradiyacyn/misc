#!/bin/bash
set -euo pipefail
if grep -q '# START_ALIAS_BLOCK' "$HOME/.bashrc"; then
  echo "nope!"
  exit 1
fi
cat >> $HOME/.bashrc <<EOF
# START_ALIAS_BLOCK
alias vi='vim'
alias ll='ls -ahl'
alias aur='yay'
alias dlba='yt-dlp -f bestaudio --extract-audio --audio-format m4a -o "%(title)s.%(ext)s"'
alias dlbv='yt-dlp -f bestvideo+bestaudio --merge-output-format mp4 -o "%(title)s.%(ext)s"'
# END_ALIAS_BLOCK
EOF
