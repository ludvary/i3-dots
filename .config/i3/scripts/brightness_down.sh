#!/bin/sh

brightnessctl s 5%-

BRIGHT=$(brightnessctl g)
MAX=$(brightnessctl m)

PERCENT=$((BRIGHT * 100 / MAX))

dunstify -r 9994 -h int:value:$PERCENT "Brightness" "$PERCENT%"
