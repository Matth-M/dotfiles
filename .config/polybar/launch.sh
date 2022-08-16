#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch bar
# polybar default 2>&1 | tee /tmp/polybar.log & disown

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload default &
  done
else
  polybar --reload default &
fi
