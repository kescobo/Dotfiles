#!/usr/bin/env bash
# wifi-menu.sh: Interactive WiFi network selector for waybar with walker

set -euo pipefail

get_wifi_status() {
  local active_ssid
  active_ssid=$(nmcli -t -f ACTIVE,SSID dev wifi list | grep '^yes' | cut -d: -f2 || echo "")

  if [[ -z "$active_ssid" ]]; then
    echo "󰤭  Disconnected"
  else
    local signal
    signal=$(nmcli -t -f ACTIVE,SIGNAL dev wifi list | grep '^yes' | cut -d: -f2)
    printf "  %s (%d%%)" "$active_ssid" "$signal"
  fi
}

show_menu() {
  # Get unique SSIDs
  local networks
  networks=$(nmcli -t -f SSID,SECURITY,SIGNAL dev wifi list |
    awk -F: '!seen[$1]++ && $1 {printf "%s\n", $1}' | sort)

  if [[ -z "$networks" ]]; then
    notify-send "WiFi" "No networks found"
    return 1
  fi

  local selected
  selected=$(echo "$networks" | walker --dmenu --placeholder "Select WiFi network") || return 1

  # If already connected, skip
  if nmcli con show --active | grep -q "$selected" 2>/dev/null; then
    return 0
  fi

  # If already configured, connect
  if nmcli con show | grep -q "$selected" 2>/dev/null; then
    nmcli con up "$selected" || notify-send "WiFi" "Failed to connect to $selected"
  else
    # New network: prompt for password via nmcli
    nmcli dev wifi connect "$selected" --ask || nm-connection-editor
  fi
}

case "${1:-status}" in
status) get_wifi_status ;;
menu) show_menu ;;
*) get_wifi_status ;;
esac
