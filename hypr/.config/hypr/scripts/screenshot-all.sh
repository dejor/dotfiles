#!/bin/bash

grim $HOME/Pictures/screenshots/$(date +'screenshots_%s.png')

ogg123 -d pulse $HOME/.config/hypr/assets/sounds/camera-shutter.ogg
