#!/bin/bash

# WARNING: This script performs destructive operations.
# /dev/sda is typically your main system drive. 
# I have replaced it with /dev/sdX to prevent accidental system destruction.
# Change 'TARGET_DRIVE' to the actual device you want to wipe (e.g., /dev/sdb).

TARGET_DRIVE="/dev/sdX"

# Check if the user has updated the placeholder
if [[ "$TARGET_DRIVE" == "/dev/sdX" ]]; then
    echo "Error: Please edit the script to set the correct TARGET_DRIVE."
    echo "Currently set to placeholder '/dev/sdX'."
    exit 1
fi

echo "WARNING: You are about to wipe $TARGET_DRIVE 3 times."
echo "All data on this device will be PERMANENTLY lost."
echo "Press Ctrl+C to cancel within 10 seconds..."
sleep 10

# Loop 3 times
for i in {1..3}
do
    echo "Starting pass $i on $TARGET_DRIVE..."
    
    # The requested command
    dd if=/dev/zero of="$TARGET_DRIVE" bs=100M conv=sync status=progress
    
    # Sync to ensure write completion before the message
    sync
    
    echo "Command has been used $i times."
done

echo "Wipe operation complete."
