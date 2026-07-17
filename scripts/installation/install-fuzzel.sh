#!/usr/bin/env bash
set -euo pipefail

# Dynamically find the directory where this script lives
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# Derive path to fuzzel folder (one level up from installation/)
SOURCE_DIR="$(realpath "$SCRIPT_DIR/../fuzzel")"
TARGET_DIR="$HOME/.local/bin"

mkdir -p "$TARGET_DIR"

for file in "$SOURCE_DIR"/*.sh; do
    if [ -f "$file" ]; then
        target_file="$TARGET_DIR/$(basename "$file")"
        ln -sf "$file" "$target_file"
        chmod +x "$target_file"
        echo "Successfully linked: $(basename "$file")"
    else
        echo "Warning: No scripts found in $SOURCE_DIR"
    fi
done