#!/bin/bash

sketchybar --add item iostat q                            \
           --set iostat icon="󱤎"                          \
                          update_freq=7                   \
                          script="$PLUGIN_DIR/iostat.sh"
