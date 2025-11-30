#!/bin/bash
set -euo pipefail
mkdir -p $HOME/.config/fontconfig/conf.d
cat > $HOME/.config/fontconfig/fonts.conf <<EOF
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<fontconfig>
  <alias>
    <family>sans-serif</family>
    <prefer>
      <family>Noto Kufi Arabic</family>
      <family>Noto Sans CJK JP</family>
      <family>Noto Sans CJK KR</family>
      <family>Noto Sans CJK SC</family>
      <family>Noto Sans CJK TC</family>
      <family>Noto Sans</family>
    </prefer>
  </alias>
  <alias>
    <family>serif</family>
    <prefer>
      <family>Noto Naskh Arabic</family>
      <family>Noto Serif CJK JP</family>
      <family>Noto Serif CJK KR</family>
      <family>Noto Serif CJK SC</family>
      <family>Noto Serif CJK TC</family>
      <family>Noto Serif</family>
    </prefer>
  </alias>
  <alias>
    <family>monospace</family>
    <prefer>
      <family>Noto Sans Mono</family>
      <family>Noto Sans Mono CJK JP</family>
      <family>Noto Sans Mono CJK KR</family>
      <family>Noto Sans Mono CJK SC</family>
      <family>Noto Sans Mono CJK TC</family>
    </prefer>
  </alias>
</fontconfig>
EOF
cat > $HOME/.config/fontconfig/conf.d/66-noto-reject-nastaliq.conf <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<fontconfig>
  <selectfont>
    <rejectfont>
      <glob>/usr/share/fonts/noto/NotoNastaliq*</glob>
    </rejectfont>
  </selectfont>
</fontconfig>
EOF
fc-cache -fv
