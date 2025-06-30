#!/bin/bash

while true; do
    # Read from the event FIFO
    if read -r event < /tmp/knob-events; then
        case "$event" in
            F13)
                app=$(hyprctl activewindow -j | jq -r '.class // "Unknown"')

                # echo "F13 detected. Active app: $app"

        if [[ "$app" == "com.mitchellh.ghostty" || "$app" == "kitty" || "$app" == "Foot" ]]; then
            wtype -M ctrl -k d -m ctrl
        elif [[ "$app" == "firefox" || "$app" == "zen" || "$app" == "google-chrome" ]]; then
            wtype -M ctrl -k tab -m ctrl
				else
					pamixer -i 5
        fi
                ;;
            F14)
        if [[ "$app" == "com.mitchellh.ghostty" || "$app" == "kitty" || "$app" == "Foot" ]]; then
            wtype -M ctrl -k u -m ctrl
        elif [[ "$app" == "firefox" || "$app" == "zen" || "$app" == "google-chrome" ]]; then
            wtype -M ctrl -M shift -k tab -m shift -m ctrl
				else
					pamixer -d 5
				fi
                ;;
        esac
    else
        # If no event, sleep for a bit before checking again
        sleep 0.1
    fi
done
