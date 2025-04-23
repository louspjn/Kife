#!/usr/bin/env bash

# Adaptado para NixOS

export PATH="/run/current-system/sw/bin:$PATH"

# Configuração do Rofi
config="$HOME/.config/rofi/bluetooth-menu.rasi"

# Sobrescrita da janela Rofi
override_disabled="mainbox { children: [ textbox-custom, listview ]; } listview { lines: 1; padding: 6px 6px 8px; }"

get_device_icon() {
  local device_mac=$1
  device_info=$(bluetoothctl info "$device_mac")
  device_icon=$(echo "$device_info" | grep "Icon:" | awk '{print $2}')

  case "$device_icon" in
  "audio-headphones" | "audio-headset") echo "󰋋 " ;;
  "video-display" | "computer") echo "󰍹 " ;;
  "audio-input-microphone") echo "󰍬 " ;;
  "input-keyboard") echo "󰌌 " ;;
  "audio-speakers") echo "󰓃 " ;;
  "input-mouse") echo "󰍽 " ;;
  "phone") echo "󰏲 " ;;
  *) echo "󰂱 " ;;
  esac
}

while true; do
  # Obter lista de dispositivos pareados
  bluetooth_devices=$(bluetoothctl devices | while read -r line; do
    device_mac=$(echo "$line" | awk '{print $2}')
    device_name=$(echo "$line" | awk '{$1=$2=""; print substr($0, 3)}')
    icon=$(get_device_icon "$device_mac")
    echo "$icon $device_name"
  done)

  options=$(
    echo "󰏌  Scan for devices"
    echo "󰂲  Disable Bluetooth"
    echo "$bluetooth_devices"
  )
  option="󰂯  Enable Bluetooth"

  # Obter status do Bluetooth
  bluetooth_status=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

  if [[ "$bluetooth_status" == "yes" ]]; then
    selected_option=$(echo -e "$options" | rofi -dmenu -i -selected-row 1 -config "${config}" -p " " || pkill -x rofi)
  else
    selected_option=$(echo -e "$option" | rofi -dmenu -i -selected-row 1 -config "${config}" -theme-str "${override_disabled}" -p " " || pkill -x rofi)
  fi

  # Sair se nenhuma opção for selecionada
  if [ -z "$selected_option" ]; then
    exit
  fi

  # Ações baseadas na opção selecionada
  case "$selected_option" in
  *"Enable Bluetooth")
    notify-send "Bluetooth Enabled" -i "package-installed-outdated"
    rfkill unblock bluetooth
    bluetoothctl power on
    sleep 1
    ;;
  *"Disable Bluetooth")
    notify-send "Bluetooth Disabled" -i "package-broken"
    rfkill block bluetooth
    bluetoothctl power off
    exit
    ;;
  *"Scan for devices")
    notify-send "Press '?' to show help." -i "package-installed-outdated"
    kitty --title '󰂱  Bluetooth TUI' bash -c "bluetui"
    ;;
  *)
    # Extrair nome do dispositivo
    device_name="${selected_option#* }"
    device_name="${device_name## }"

    if [[ -n "$device_name" ]]; then
      # Obter endereço MAC
      device_mac=$(bluetoothctl devices | grep "$device_name" | awk '{print $2}')

      # Conectar ao dispositivo
      bluetoothctl connect "$device_mac" &
      sleep 3
      connection_status=$(bluetoothctl info "$device_mac" | grep "Connected:" | awk '{print $2}')

      if [[ "$connection_status" == "yes" ]]; then
        notify-send "Connected to \"$device_name\"." -i "package-installed-outdated"
        exit
      else
        notify-send "Failed to connect to \"$device_name\"." -i "package-broken"
      fi
    fi
    ;;
  esac
done
