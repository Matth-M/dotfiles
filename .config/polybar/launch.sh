#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch bar
# polybar default 2>&1 | tee /tmp/polybar.log & disown
