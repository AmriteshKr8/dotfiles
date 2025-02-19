#!/bin/bash

music_icon="󰽰"  # Make sure to use a font that supports this, like FontAwesome or NerdFonts

# Check if any player is running
if playerctl status > /dev/null 2>&1; then
    # If player is running, get the current track information
    current_track=$(playerctl metadata --format "{{ artist }} - {{ title }}")
    output=$(playerctl status)
    status=""
    if [[ $output == "Paused" ]]; then
        status="󱖐"
    elif [[ $output == "Playing" ]]; then
        status="󱖏"
    elif [[ $output == "Stopped" ]]; then
        status=""
    fi
    if [ -z "$current_track" ]; then
        echo "󰽳"
    else
        echo "$music_icon $status $current_track"
    fi
else
    # If no player is found, display a custom message with the icon
    echo "󰽳"
fi
