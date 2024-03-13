#!/bin/bash

if amixer sget Master | grep -q '\[off\]'; then
    amixer sset Master unmute
else
    amixer sset Master mute
fi
