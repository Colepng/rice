#!/bin/bash

#Apps
rfkill block bluetooth &
dunst &
discord --start-minimized &
swww init &
wpg -m &
waybar &
udiskie &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
mpd-discord-rpc & 
