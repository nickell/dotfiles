#!/usr/bin/env bash

if ! pgrep -x "ranger" > /dev/null
then
    alacritty -t "Ranger" -e "ranger"
fi
