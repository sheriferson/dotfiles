#!/bin/bash

TOUCHSCREEN="nvtk0603:00-0603:f001"

pkill -f "monitor-sensor" 2>/dev/null

monitor-sensor | while read -r line; do
    case "$line" in
        *"orientation changed: normal"*)
            # Laptop mode (landscape)
            hyprctl keyword monitor "eDP-1,preferred,auto,2,transform,3"
            hyprctl keyword "device[$TOUCHSCREEN]:transform" 3
            ;;
        *"orientation changed: left-up"*)
            # Tablet portrait (rotated left)
            hyprctl keyword monitor "eDP-1,preferred,auto,2,transform,0"
            hyprctl keyword "device[$TOUCHSCREEN]:transform" 0
            ;;
        *"orientation changed: right-up"*)
            # Tablet portrait (rotated right)
            hyprctl keyword monitor "eDP-1,preferred,auto,2,transform,2"
            hyprctl keyword "device[$TOUCHSCREEN]:transform" 2
            ;;
        *"orientation changed: bottom-up"*)
            # Laptop mode flipped
            hyprctl keyword monitor "eDP-1,preferred,auto,2,transform,1"
            hyprctl keyword "device[$TOUCHSCREEN]:transform" 1
            ;;
    esac
done
