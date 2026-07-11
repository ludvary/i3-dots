#!/bin/sh

pactl set-sink-mute @DEFAULT_SINK@ toggle

MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

if [ "$MUTED" = "yes" ]; then
    dunstify -r 9993 "Volume" "Muted"
else
    VOL=$(pactl get-sink-volume @DEFAULT_SINK@ \
        | grep -o '[0-9]*%' \
        | head -1 \
        | tr -d '%')

    dunstify -r 9993 -h int:value:$VOL "Volume" "$VOL%"
fi
