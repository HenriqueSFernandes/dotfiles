#!/bin/bash
while read -r event; do
    if [[ "$event" == *"KEY_F13"* ]]; then
				/home/ricky/.config/interception/scripts/f13-action.sh &
    elif [[ "$event" == *"KEY_F14"* ]]; then
				/home/ricky/.config/interception/scripts/f14-action.sh &
    fi
		echo "$event"
done
