#!/usr/bin/env bash

# Adaptado para NixOS

export PATH="/run/current-system/sw/bin:$PATH"

config="$HOME/.config/rofi/power-menu.rasi"

actions=$(echo -e "’öæ  Lock\n’Ćæ  Shutdown\n’ĆĪ  Reboot\n’Ŗī  Suspend\n’ō«  Hibernate\n¾░×ś  Logout")

selected_option=$(echo -e "$actions" | rofi -dmenu -i -config "${config}" || pkill -x rofi)

case "$selected_option" in
*Lock)
  loginctl lock-session
  ;;
*Shutdown)
  systemctl poweroff
  ;;
*Reboot)
  systemctl reboot
  ;;
*Suspend)
  systemctl suspend
  ;;
*Hibernate)
  systemctl hibernate
  ;;
*Logout)
  loginctl kill-session "$XDG_SESSION_ID"
  ;;
esac
