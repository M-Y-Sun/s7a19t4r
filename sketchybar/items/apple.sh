#!/bin/bash

POPUP_OFF='sketchybar --set apple.logo popup.drawing=off'
POPUP_CLICK_SCRIPT='sketchybar --set $NAME popup.drawing=toggle'

apple_logo=(
    background.color=$ITEM_BG_COLOR
    shadow=on
    icon=""
    icon.font="DejaVuSansM Nerd Font:Bold:16.0"
    icon.color=$ACCENT_COLOR
    icon.padding_right=8
    icon.padding_left=8
    label.drawing=off
    click_script="$POPUP_CLICK_SCRIPT"
    popup.height=38
)

apple_prefs=(
    icon=""
    label="Preferences"
    click_script="open -a 'System Preferences'; $POPUP_OFF"
)

apple_lock=(
    icon=""
    label="Lock Screen"
    click_script="pmset displaysleepnow; $POPUP_OFF"
)

apple_logout=(
    icon="󰍃"
    label="Log Out"
    click_script="killall loginwindow; $POPUP_OFF"
)

apple_sleep=(
    icon="󰤄"
    label="Sleep"
    click_script="pmset displaysleepnow; $POPUP_OFF"
)

apple_reboot=(
    icon="󰜉"
    label="Reboot"
    click_script="shutdown -r now; $POPUP_OFF"
)

apple_halt=(
    icon=""
    label="Shut Down"
    click_script="shutdown -h now; $POPUP_OFF"
)

sketchybar --add item apple.logo left                   \
           --set apple.logo "${apple_logo[@]}"          \
                                                        \
           --add item apple.prefs popup.apple.logo      \
           --set apple.prefs "${apple_prefs[@]}"        \
                                                        \
           --add item apple.lock popup.apple.logo       \
           --set apple.lock "${apple_lock[@]}"          \
                                                        \
           --add item apple.logout popup.apple.logo     \
           --set apple.logout "${apple_logout[@]}"      \
                                                        \
           --add item apple.sleep popup.apple.logo      \
           --set apple.sleep "${apple_sleep[@]}"        \
                                                        \
           --add item apple.reboot popup.apple.logo     \
           --set apple.reboot "${apple_reboot[@]}"      \
                                                        \
           --add item apple.halt popup.apple.logo       \
           --set apple.halt "${apple_halt[@]}"          \
