#!/usr/bin/env bash
set -euo pipefail

# Dynamically find the directory where this script lives
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# Derive path to bash folder (one level up from installation/)
DOTFILES_BASH="$(realpath "$SCRIPT_DIR/../bash")"
LOCAL_BIN="$HOME/.local/bin"

mkdir -p "$LOCAL_BIN"

for script in cpcpl pscpl; do
    SOURCE="$DOTFILES_BASH/$script"
    TARGET="$LOCAL_BIN/$script"

    if [ -f "$SOURCE" ]; then
        ln -sf "$SOURCE" "$TARGET"
        chmod +x "$TARGET"
        echo "Successfully linked: $script"
    else
        echo "Error: Source file $SOURCE not found!"
        echo "Check if $DOTFILES_BASH exists."
    fi
done