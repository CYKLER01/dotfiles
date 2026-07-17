#!/bin/bash
# ~/.dotfiles/scripts/installation/install-bash.sh

# 1. Get the directory where this script is located
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# 2. Derive the path to the bash scripts folder (go up two levels from installation/)
DOTFILES_BASH="$(realpath "$SCRIPT_DIR/../bash")"
LOCAL_BIN="$HOME/.local/bin"

# 3. Ensure target directory exists
mkdir -p "$LOCAL_BIN"

# 4. Process
for script in cpcpl pscpl; do
    SOURCE="$DOTFILES_BASH/$script"
    TARGET="$LOCAL_BIN/$script"

    if [ -f "$SOURCE" ]; then
        ln -sf "$SOURCE" "$TARGET"
        chmod +x "$TARGET"
        echo "Successfully linked and set executable: $script"
    else
        echo "Error: Source file $SOURCE not found!"
        echo "Check if $DOTFILES_BASH exists."
    fi
done