#!/bin/bash
# changeVolume

source /home/chad/.dotfiles/arch/bin/get-progress-string.sh

# Arbitrary but unique message id
msgId="991049"

# Change the volume using alsa
amixer -c 0 set Master "$@" > /dev/null

# Query amixer for the current volume and whether or not the speaker is muted
volume="$(amixer -c 0 get Master | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g')"
mute="$(amixer -c 0 get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
if [[ $volume == 0 || "$mute" == "off" ]]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" -u low -r "$msgId" "🔇 Volume muted" 
else
    # Show the volume notification
    dunstify -a "changeVolume" -u low -r "$msgId" -t 1000 \
    "🔉: ${volume}%" "<span font=\"monospace\">$(getProgressString 10 "#" "-" $volume)</span>"
fi
