#!/bin/bash

sketchybar --set $NAME label="$(curl -s 'wttr.in/San+Diego?format=%C+%f&m')"
