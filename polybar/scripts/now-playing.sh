music_icon="Now playing:"  # Make sure to use a font that supports this, like FontAwesome or NerdFonts

# Check if any player is running
if playerctl status > /dev/null 2>&1; then
    # If player is running, get the current track information
    current_track=$(playerctl metadata --format "{{ artist }} - {{ title }}")
    if [ -z "$current_track" ]; then
        echo "$music_icon No track playing"
    else
        echo "$music_icon $current_track"
    fi
else
    # If no player is found, display a custom message with the icon
    echo "'n'"
fi
