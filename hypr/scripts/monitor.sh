#!/bin/bash

if hyprctl monitors | grep -o "Monitor DP-2"
then
	wlr-randr --output eDP-1 --off
fi
