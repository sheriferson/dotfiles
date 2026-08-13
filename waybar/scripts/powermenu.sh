#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────────
#  Rofi Power Menu
#  Provides a simple system power menu integrated with Waybar.
#  Example:
#      ./powermenu.sh
#      # Opens a Rofi menu with power options
# ─────────────────────────────────────────────────────────────────────────────

rofi_command="rofi -dmenu -p Power"

options="Shutdown\nReboot\nLogout\nSuspend\nLock"

chosen="$(echo -e "$options" | $rofi_command)"
case $chosen in
    Shutdown) systemctl poweroff ;;
    Reboot) systemctl reboot ;;
    Logout) loginctl kill-session $XDG_SESSION_ID ;;
    Suspend) systemctl suspend ;;
    Lock) hyprlock -q ;;
esac
