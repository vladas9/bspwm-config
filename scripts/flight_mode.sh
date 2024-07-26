#!/bin/bash

# Path to store the previous state
previous_state_file="/tmp/flight_mode_state"

# Get the current state
if nmcli -t r | grep -q 'disabled'; then
    current_state="Enabled"
else
    current_state="Disabled"
fi

# Check if the state has changed
if [ -f "$previous_state_file" ]; then
    previous_state=$(cat "$previous_state_file")
    if [ "$current_state" != "$previous_state" ]; then
        # Send a notification if the state has changed
        notify-send "Flight Mode $current_state"
    fi
fi

# Save the current state for future comparison
echo "$current_state" > "$previous_state_file"

# Display the icon based on the current state
if [ "$current_state" == "Enabled" ]; then
    echo "  "
else
    echo ""
fi

