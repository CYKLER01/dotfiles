#!/bin/bash

pkill hyprpaper

# Define the root directory where your wallpapers are located
WALLPAPERS_ROOT_DIR="$HOME/Pictures/my_wallpapers"

# Use 'find' to locate all image files (jpg, png, jpeg, gif) recursively
# and then 'shuf' (shuffle) to pick one randomly.
# The 'null-terminated' options (-print0 and -0) are important for handling spaces in filenames.
WALLPAPER=$(find "$WALLPAPERS_ROOT_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.gif" \) -print0 | shuf -n 1 -z | xargs -0)

# Check if a wallpaper was found
if [ -z "$WALLPAPER" ]; then
    echo "Error: No wallpaper found in $WALLPAPERS_ROOT_DIR or its subdirectories." >&2
    exit 1
fi

# Set the wallpaper using swww with your desired transition
swww img "$WALLPAPER" \
    --transition-type wipe \
    --transition-duration 1 \
    --transition-fps 60

echo "Set wallpaper to: $WALLPAPER"
