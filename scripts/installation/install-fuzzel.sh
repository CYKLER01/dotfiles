#!/bin/bash
# ~/.local/bin/install-fuzzel.sh

# 1. Ensure the directory exists
mkdir -p "$HOME/.local/bin"

# 2. Link the files individually
for file in "$HOME/dotfiles/scripts/fuzzel/"*.sh; do
    if [ -f "$file" ]; then
        ln -sf "$file" "$HOME/.local/bin/"
        # Extract filename to chmod it
        filename=$(basename "$file")
        chmod +x "$HOME/.local/bin/$filename"
        echo "Installed $filename"
    fi
done

echo "Fuzzel menu scripts processing complete."