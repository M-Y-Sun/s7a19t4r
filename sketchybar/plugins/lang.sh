#!/bin/bash

# language codes
ENG="U.S."
GK="Greek"
CN="com.apple.inputmethod.SCIM.ITABC"

# read two variables for eastern and western languages because english and greek are western and chinese is eastern
WEST_LANG=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep 'KeyboardLayout Name' | sed -E 's/^.+ = \"?([^\"]+)\"?;$/\1/')
EAST_LANG=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep -w 'Input Mode' | head -1 | sed -E 's/^.+ = \"?([^\"]+)\"?;$/\1/')

if [ $WEST_LANG = $ENG ]; then
    ICON="󰬈"
    LABEL="ENG"
elif [ $WEST_LANG = $GK ]; then
    ICON="󰘧"
    LABEL="GK"
elif [ $EAST_LANG = $CN ]; then
    ICON="文"
    LABEL="CN"
else
    ICON="󰟢"
    LABEL="NULL"
fi

sketchybar --set $NAME icon=$ICON label=$LABEL
