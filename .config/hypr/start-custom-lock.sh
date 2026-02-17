#!/bin/bash
TEXT="$1"
TEMPLATE="$HOME/.config/hypr/lock-text-template.conf"
CONFIG="$HOME/.config/hypr/lock-text.conf"

sed "s/{{TEXT}}/$TEXT/" "$TEMPLATE" > "$CONFIG"
hyprlock -c "$CONFIG"
