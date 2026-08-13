#!/bin/bash
# workspace-8.sh — highlight workspace 8 if active

active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 8 ]; then
  echo " <span foreground='#fab387'>●</span> "
else
  echo " 8 "
fi
