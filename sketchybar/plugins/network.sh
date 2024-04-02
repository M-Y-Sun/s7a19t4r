#!/bin/bash

AIRPORTCMD="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
LABEL=$($AIRPORTCMD -I | awk 'NR==13 {print $2}')

STRENGTH=$($AIRPORTCMD -I | grep agrCtlRSSI | awk '{print $2}' | tr -d '-')

#### $INFO IS BROKEN IN SONOMA ####
#     if [ "$INFO" = "" ]; then
#         ICON="󰖪"
#     fi

case $STRENGTH in
    [6-9][0-9]) 
        ICON="󰤨"
        ;;
    [3-5][0-9]) 
        ICON="󰤢"
        ;;
    [1-9]|[1-2][0-9]) 
        ICON="󰤟"
        ;;
    *) 
        ICON="󰤭"
esac

sketchybar --set $NAME icon="$ICON" label="$LABEL"
