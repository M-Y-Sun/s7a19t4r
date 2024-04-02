#!/bin/bash

sketchybar --set $NAME label="$(iostat | awk 'NR == 3 { printf("%02.02f MB/s", $6) }')"
