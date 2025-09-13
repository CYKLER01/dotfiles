#!/bin/bash

# Get the current status from windscribe-cli
status=$(windscribe-cli status | grep 'Connect state:' | awk '{print $3}')

# Check if the status is "Connected"
if [[ "$status" == "Connected:" ]]; then
    # If connected, get the location name
    location=$(windscribe-cli status | grep 'Connect state:' | awk '{print $4, $5, $6}')
    echo "Connected: $location"
#else
    # If disconnected, show the text "Disconnected"
    #echo "Disconnected"
fi
