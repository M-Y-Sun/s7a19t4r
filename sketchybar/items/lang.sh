#!/bin/bash

sketchybar --add item lang right                    \
           --set lang update_freq=1                 \
                      script="$PLUGIN_DIR/lang.sh"  
