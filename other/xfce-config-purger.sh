#!/bin/bash
set -euo pipefail
shopt -s nullglob
rm -rf $HOME/.cache/xfce4
rm -rf $HOME/.cache/sessions/*
rm -rf $HOME/.cache/thumbnails/*
rm -rf $HOME/.config/xfce4
rm -rf $HOME/.config/menus/xfce-applications.menu
rm -rf $HOME/.local/share/xfce-backups
rm -rf $HOME/.local/share/xfce4
rm -rf $HOME/.local/share/applications/*xfce*
rm -rf $HOME/.local/share/desktop-directories/*xfce*
shopt -u nullglob
