#!/bin/bash
# workspace-7.sh — highlight workspace 7 if active

active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 7 ]; then
  echo " <span foreground='#fab387'>●</span> "
else
  echo " 7 "
fi
