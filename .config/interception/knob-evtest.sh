#!/bin/bash

DEVICE="/dev/input/event16"

sudo evtest "$DEVICE" | while read -r line; do
    if echo "$line" | grep -q "KEY_F13.*value 1"; then
        # Detect active window
        app=$(hyprctl activewindow -j | jq -r '.class')

        if [[ "$app" == "com.mitchellh.ghostty" || "$app" == "kitty" || "$app" == "Foot" ]]; then
            wtype -M ctrl -k d -m ctrl
        elif [[ "$app" == "firefox" || "$app" == "zen" || "$app" == "google-chrome" ]]; then
            wtype -M ctrl -k tab -m ctrl
        fi

    elif echo "$line" | grep -q "KEY_F14.*value 1"; then
        if [[ "$app" == "com.mitchellh.ghostty" || "$app" == "kitty" || "$app" == "Foot" ]]; then
            wtype -M ctrl -k u -m ctrl
        elif [[ "$app" == "firefox" || "$app" == "zen" || "$app" == "google-chrome" ]]; then
            wtype -M ctrl -M shift -k tab -m shift -m ctrl
				fi
    fi
done

