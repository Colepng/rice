#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini

polybar -r -c /home/cole/.config/polybar/Themes/kingdom/bar.ini default | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
