#!/bin/bash

# Run hyprctl devices and capture the output
output=$(hyprctl devices)

# Extract block for sino-wealth-61keyboard-1 and get active keymap line
active_keymap=$(echo "$output" | awk '
    /sino-wealth-61keyboard-1/ {found=1}
    found && /active keymap:/ {
        print $0
        exit
    }
')

# Check if "intl" is in the keymap string
if echo "$active_keymap" | grep -q "intl"; then
    echo true
else
    echo false
fi

