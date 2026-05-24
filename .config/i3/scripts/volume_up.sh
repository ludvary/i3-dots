#!/bin/sh

pactl set-sink-volume @DEFAULT_SINK@ +5%

VOL=$(pactl get-sink-volume @DEFAULT_SINK@ \
    | grep -o '[0-9]*%' \
    | head -1 \
    | tr -d '%')

dunstify -r 9993 -h int:value:$VOL "Volume" "$VOL%"
