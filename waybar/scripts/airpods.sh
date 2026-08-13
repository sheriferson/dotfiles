#!/usr/bin/env bash

# Dependencies: Materials Icon font for the glyphs

device=$2

grey=#928374
green=#55aa55
yellow=#fabd2f

service_running=$(systemctl is-active "bluetooth.service")
controller_on=$(bluetoothctl show | grep "Powered: yes")
device_paired=$(bluetoothctl devices Paired | grep $device)
device_connected=$(bluetoothctl info $device | grep "Connected: yes")
device_blocked=$(bluetoothctl info $device | grep "Blocked: yes")

status_str() {
    if [[ $service_running ]] && [[ $controller_on ]] && [[ $device_paired ]]; then
        if [[ $device_connected ]]; then
            echo "󱡏"
        elif [[ $controller_on ]] && [[ ! $device_blocked ]];then
            echo "connecting..."
        else
            echo "󱡐"
        fi
    else
        echo "I don't know"
    fi
}

toggle_state() {
    if [[ ! $device_paired ]];then
      return 1
    fi

    if [[ $device_connected ]]; then
        bluetoothctl disconnect $device
        bluetoothctl block $device
    elif [[ $controller_on ]] && [[ ! $device_blocked ]];then
        bluetoothctl block $device
    elif [[ $controller_on ]] && [[ $device_blocked ]];then
        bluetoothctl unblock $device
        bluetoothctl connect $device
    else
        bluetoothctl power on
        bluetoothctl unblock $device
        bluetoothctl connect $device
    fi
}

maybe_block() {
    if [[ $controller_on ]] && [[ $device_paired ]] && [[ ! $device_connected ]] && [[ ! $device_blocked ]];then
        bluetoothctl block $device
    fi
}

case "$1" in
    --toggle)
        toggle_state
        ;;
    --status)
        status_str
        ;;
    --block-if-not-connected)
        maybe_block
        ;;
esac
