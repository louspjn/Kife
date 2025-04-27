#!/usr/bin/env bash

# Adaptado para NixOS

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

# Obter o estado da bateria da regra udev
BATTERY_STATE=$1

# Obter porcentagem da bateria usando upower
BAT_PATH=$(upower -e | grep -i battery | head -n 1)
if [ -z "$BAT_PATH" ]; then
  exit 0
fi

BATTERY_LEVEL=$(upower -i "$BAT_PATH" | awk '/percentage:/ {print $2}' | tr -d '%')

# Definir estado de carregamento e ícone
case "$BATTERY_STATE" in
"charging")
  BATTERY_CHARGING="Charging"
  BATTERY_ICON="090-charging"
  ;;
"discharging")
  BATTERY_CHARGING="Discharging"
  BATTERY_ICON="090"
  ;;
*)
  exit 0
  ;;
esac

# Usar notify-send do NixOS
NOTIFY_SEND="/run/current-system/sw/bin/notify-send"

# Enviar notificação
$NOTIFY_SEND -a "state" "Battery ${BATTERY_CHARGING} (${BATTERY_LEVEL}%)" -u normal -i "battery-${BATTERY_ICON}" -r 9991
