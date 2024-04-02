#!/bin/bash

sketchybar --add item weather right                     \
           --set weather update_freq=12000              \
                        icon="󰖕"                        \
                        script="$PLUGIN_DIR/weather.sh"

