#!/bin/bash

#Apps
dunst &
discord --start-minimized &
swww init &
wpg -s colour_bomb.png &
waybar &
udiskie &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
mpd-discord-rpc & 
mpDris2 & 
playerctld daemon &
swayidle \
    timeout 180 'hyprctl dispatch dpms off' \
    # resume 'hyprctl dispatch dpms on' \
