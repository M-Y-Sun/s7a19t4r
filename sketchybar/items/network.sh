#!/bin/bash

sketchybar --add item network right                         \
           --set network update_freq=8                      \
                         script="$PLUGIN_DIR/network.sh"
