#!/usr/bin/env bash

# Adaptado para NixOS

export PATH="/run/current-system/sw/bin:$PATH"

config="$HOME/.config/rofi/window.rasi"

rofi -show drun -p " " -config "${config}" || pkill -x rofi
