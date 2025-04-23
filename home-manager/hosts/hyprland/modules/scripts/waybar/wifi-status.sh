#!/usr/bin/env bash

# Adaptado para NixOS

export PATH="/run/current-system/sw/bin:$PATH"

if ! command -v nmcli &>/dev/null; then
  echo "{\"text\": \"󰤫\", \"tooltip\": \"nmcli utility is missing\"}"
  exit 1
fi

wifi_status=$(nmcli radio wifi)

if [ "$wifi_status" = "disabled" ]; then
  echo "{\"text\": \"󰤮\", \"tooltip\": \"Wi-Fi Disabled\"}"
  exit 0
fi

wifi_info=$(nmcli -t -f active,ssid,signal,security dev wifi | grep "^yes")

if [ -z "$wifi_info" ]; then
  essid="No Connection"
  signal=0
  tooltip="No Connection"
else
  ip_address="127.0.0.1"
  security=$(echo "$wifi_info" | awk -F: '{print $4}')
  signal=$(echo "$wifi_info" | awk -F: '{print $3}')

  active_device=$(nmcli -t -f DEVICE,STATE device status |
    grep -w "connected" |
    grep -v -E "^(dummy|lo:|virbr0)" |
    awk -F: '{print $1}')

  if [ -n "$active_device" ]; then
    output=$(nmcli -e no -g ip4.address device show "$active_device")
    ip_address=$(echo "$output" | sed -n '1p')

    line=$(nmcli -e no -t -f active,bssid,chan,freq device wifi | grep "^yes")
    chan=$(echo "$line" | awk -F':' '{print $8}')
    freq=$(echo "$line" | awk -F':' '{print $9}')
    chan="$chan ($freq)"

    essid=$(echo "$wifi_info" | awk -F: '{print $2}')

    tooltip=":: ${essid}"
    tooltip+="\nIP Address: ${ip_address}"
    tooltip+="\nSecurity:   ${security}"
    tooltip+="\nChannel:    ${chan}"
    tooltip+="\nStrength:   ${signal} / 100"
  fi
fi

if [ "$signal" -ge 80 ]; then
  icon="󰤨"
elif [ "$signal" -ge 60 ]; then
  icon="󰤥"
elif [ "$signal" -ge 40 ]; then
  icon="󰤢"
elif [ "$signal" -ge 20 ]; then
  icon="󰤟"
else
  icon="󰤯"
fi

echo "{\"text\": \"${icon}\", \"tooltip\": \"${tooltip}\"}"
