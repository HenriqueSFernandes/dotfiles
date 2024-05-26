#!/bin/bash

if pgrep -x "hypridle" > /dev/null; then
	pkill hypridle
else
  hypridle &
fi
