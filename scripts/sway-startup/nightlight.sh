#!/bin/bash

# Get the absolute path to the directory this script is in
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Navigate to the correct target directory (../systemd)
SYSTEMD_DIR="$SCRIPT_DIR/../systemd"

# Get current time in minutes since midnight
current_minutes=$(date +%H)
current_minutes=$((10#$current_minutes * 60 + 10#$(date +%M)))

# Define time bounds: 5:30 AM to 7:30 PM
start_time=$((5 * 60 + 30))   # 330
end_time=$((19 * 60 + 30))    # 1170

if [ "$current_minutes" -ge "$start_time" ] && [ "$current_minutes" -lt "$end_time" ]; then
    "$SYSTEMD_DIR/set_temp_low.sh" &
else
    "$SYSTEMD_DIR/set_temp_high.sh" &
fi

