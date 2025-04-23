#!/usr/bin/env bash

# Adaptado para NixOS

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

# Níveis da bateria
WARNING_LEVEL=20
CRITICAL_LEVEL=10

# Obter informações da bateria usando upower
BAT_PATH=$(upower -e | grep -i battery | head -n 1)
if [ -z "$BAT_PATH" ]; then
  exit 0
fi

BATTERY_STATE=$(upower -i "$BAT_PATH" | awk '/state:/ {print $2}')
BATTERY_LEVEL=$(upower -i "$BAT_PATH" | awk '/percentage:/ {print $2}' | tr -d '%')

# Prevenir múltiplas notificações
FILE_FULL=/tmp/battery-full
FILE_WARNING=/tmp/battery-warning
FILE_CRITICAL=/tmp/battery-critical

# Remover arquivos se o estado da bateria mudou
if [ "$BATTERY_STATE" == "discharging" ]; then
  rm -f $FILE_FULL
elif [ "$BATTERY_STATE" == "charging" ]; then
  rm -f "$FILE_WARNING" "$FILE_CRITICAL"
fi

# Usar notify-send do NixOS
NOTIFY_SEND="/run/current-system/sw/bin/notify-send"

# Se a bateria estiver cheia e conectada
if [ "$BATTERY_LEVEL" -eq 100 ] && [ "$BATTERY_STATE" == "fully-charged" ] && [ ! -f $FILE_FULL ]; then
  $NOTIFY_SEND -a "state" "Battery Charged (${BATTERY_LEVEL}%)" "You might want to unplug your PC." -i "battery-full" -r 9991
  touch $FILE_FULL

# Se a bateria estiver baixa e descarregando
elif [ "$BATTERY_LEVEL" -le $WARNING_LEVEL ] && [ "$BATTERY_STATE" == "discharging" ] && [ ! -f $FILE_WARNING ]; then
  $NOTIFY_SEND -a "state" "Battery Low (${BATTERY_LEVEL}%)" "You might want to plug in your PC." -u critical -i "battery-caution" -r 9991
  touch $FILE_WARNING

# Se a bateria estiver crítica e descarregando
elif [ "$BATTERY_LEVEL" -le $CRITICAL_LEVEL ] && [ "$BATTERY_STATE" == "discharging" ] && [ ! -f $FILE_CRITICAL ]; then
  $NOTIFY_SEND -a "state" "Battery Critical (${BATTERY_LEVEL}%)" "Plug in your PC now." -u critical -i "battery-empty" -r 9991
  touch $FILE_CRITICAL
fi
