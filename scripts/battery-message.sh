#!/bin/bash

battery="/sys/class/power_supply/BAT0"
capacity=$(cat $battery/capacity)
notify-send -u low "Battery: $capacity%"
