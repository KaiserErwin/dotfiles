#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config

polybar laptop -c ~/.config/polybar/material.ini &
polybar laptop-left -c ~/.config/polybar/material.ini &
polybar laptop-center -c ~/.config/polybar/material.ini &
polybar laptop-right -c ~/.config/polybar/material.ini &
#polybar tray -c ~/.config/polybar/material.ini &
ln -sf /tmp/polybar_mqueue.$! /tmp/ipc-bottom

# my_laptop_external_monitor=$(xrandr --query | grep 'HDMI1')
# if [[ $my_laptop_external_monitor == /^connected/ ]]; then
  polybar monitor -c ~/.config/polybar/material.ini &
  polybar monitor-left -c ~/.config/polybar/material.ini &
  polybar monitor-center -c ~/.config/polybar/material.ini &
  polybar monitor-right -c ~/.config/polybar/material.ini &
# fi

echo "Polybar launched..."
