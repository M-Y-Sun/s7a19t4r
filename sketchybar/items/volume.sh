#!/bin/bash

sketchybar --add item volume right                      \
           --set volume script="$PLUGIN_DIR/volume.sh"  \
           --subscribe volume volume_change             # the script will run every time the volume changes

