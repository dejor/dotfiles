#!/bin/bash

hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | grim -g - $HOME/Pictures/screenshots/$(date +'screenshots_%s.png') 

ogg123 -d pulse $HOME/.config/hypr/assets/sounds/camera-shutter.ogg

