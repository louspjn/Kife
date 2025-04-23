#!/usr/bin/env bash

# Adaptado para NixOS

export PATH="/run/current-system/sw/bin:$PATH"

config="$HOME/.config/rofi/wifi-menu.rasi"

options=$(
  echo "  Manual Entry"
  echo "󰤮  Disable Wi-Fi"
)
option_disabled="󰤥  Enable Wi-Fi"

override_ssid="entry { placeholder: \"Enter SSID\"; } listview { lines: 0; padding: 20px 6px; }"
override_password="entry { placeholder: \"Enter password\"; } listview { lines: 0; padding: 20px 6px; }"
override_disabled="mainbox { children: [ textbox-custom, listview ]; } listview { lines: 1; padding: 6px 6px 8px; }"

get_password() {
  rofi -dmenu -password -config "${config}" -theme-str "${override_password}" -p " " || pkill -x rofi
}

while true; do
  wifi_list() {
    nmcli --fields "SECURITY,SSID" device wifi list |
      tail -n +2 |
      sed 's/  */ /g' |
      sed -E "s/WPA*.?\S/󰤪 /g" |
      sed "s/^--/󰤨 /g" |
      sed "s/󰤪  󰤪/󰤪/g" |
      sed "/--/d" |
      awk '!seen[$0]++'
  }

  wifi_status=$(nmcli -fields WIFI g)

  case "$wifi_status" in
  *"enabled"*)
    selected_option=$(echo "$options"$'\n'"$(wifi_list)" |
      rofi -dmenu -i -selected-row 1 -config "${config}" -p " " || pkill -x rofi)
    ;;
  *"disabled"*)
    selected_option=$(echo "$option_disabled" |
      rofi -dmenu -i -config "${config}" -theme-str "${override_disabled}" || pkill -x rofi)
    ;;
  esac

  read -r selected_ssid <<<"${selected_option:3}"

  case "$selected_option" in
  "")
    exit
    ;;
  *"Enable Wi-Fi")
    notify-send "Scanning for networks..." -i "package-installed-outdated"
    nmcli radio wifi on
    nmcli device wifi rescan
    sleep 3
    ;;
  *"Disable Wi-Fi")
    notify-send "Wi-Fi Disabled" -i "package-broken"
    nmcli radio wifi off
    exit
    ;;
  *"Manual Entry")
    manual_ssid=$(rofi -dmenu -config "${config}" -theme-str "${override_ssid}" -p " " || pkill -x rofi)

    if [ -z "$manual_ssid" ]; then
      exit
    fi

    wifi_password=$(get_password)

    if [ -z "$wifi_password" ]; then
      if nmcli device wifi connect "$manual_ssid" | grep -q "successfully"; then
        notify-send "Connected to \"$manual_ssid\"." -i "package-installed-outdated"
        exit
      else
        notify-send "Failed to connect to \"$manual_ssid\"." -i "package-broken"
      fi
    else
      if nmcli device wifi connect "$manual_ssid" password "$wifi_password" | grep -q "successfully"; then
        notify-send "Connected to \"$manual_ssid\"." -i "package-installed-outdated"
        exit
      else
        notify-send "Failed to connect to \"$manual_ssid\"." -i "package-broken"
      fi
    fi
    ;;
  *)
    saved_connections=$(nmcli -g NAME connection)

    if echo "$saved_connections" | grep -qw "$selected_ssid"; then
      if nmcli connection up id "$selected_ssid" | grep -q "successfully"; then
        notify-send "Connected to \"$selected_ssid\"." -i "package-installed-outdated"
        exit
      else
        notify-send "Failed to connect to \"$selected_ssid\"." -i "package-broken"
      fi
    else
      if [[ "$selected_option" =~ ^"󰤪" ]]; then
        wifi_password=$(get_password)
      fi

      if nmcli device wifi connect "$selected_ssid" password "$wifi_password" | grep -q "successfully"; then
        notify-send "Connected to \"$selected_ssid\"." -i "package-installed-outdated"
        exit
      else
        notify-send "Failed to connect to \"$selected_ssid\"." -i "package-broken"
      fi
    fi
    ;;
  esac
done
