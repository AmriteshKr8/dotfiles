#!/bin/bash

# Get user profile picture (set your path if different)
USER_PIC="$HOME/.face"
[ ! -f "$USER_PIC" ] && USER_PIC="/usr/share/icons/default.png"  # Fallback image

# Define power options
OPTIONS="󰌾 Lock\n󰒲 Suspend\n󰜉 Reboot\n⏻ Shutdown\n󰗽 Logout"

dir="$HOME/.config/rofi/launchers/type-6"
theme='style-10'

CHOICE=$(echo "$OPTIONS" | rofi -dmenu -theme ${dir}/${theme}.rasi -theme-str 'window { width: 600px; }' -theme-str 'window { width: 400px; } listview { lines: 5; }' -i -p "Power Menu")

case "$CHOICE" in
    "󰌾 Lock")     lock ;;
    "󰒲 Suspend")  systemctl suspend ;;
    "󰜉 Reboot")  systemctl reboot ;;
    "⏻ Shutdown") systemctl poweroff ;;
    "󰗽 Logout")   i3-msg exit ;;
esac
