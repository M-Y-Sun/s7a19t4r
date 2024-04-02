#!/bin/bash

sketchybar --add item ram q                     \
           --set ram update_freq=5              \
                     icon="󰍛"                   \
                     script="$PLUGIN_DIR/ram.sh"
