#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
DOTFILES_ROOT="$(realpath "$SCRIPT_DIR/../..")"

HYPR_TARGET="$HOME/.config/hypr"
CAELESTIA_TARGET="$HOME/.config/caelestia"

# Create target directories
mkdir -p "$HYPR_TARGET"
mkdir -p "$(dirname "$CAELESTIA_TARGET")"

rm -rf "$HYPR_TARGET"/*

# 2. Symlink subdirectories inside config/hypr (hyprland, scheme)
for dir in "$DOTFILES_ROOT/config/hypr/"*/; do
  dirname=$(basename "$dir")
  ln -sf "$dir" "$HYPR_TARGET/$dirname"
done

# 3. Symlink root-level files inside config/hypr (hyprland.lua, variables.lua)
for file in "$DOTFILES_ROOT/config/hypr/"*.lua; do
  [ -e "$file" ] && ln -sf "$file" "$HYPR_TARGET/"
done

# 4. Properly symlink the caelestia directory to ~/.config/caelestia
rm -rf "$CAELESTIA_TARGET"
ln -sf "$DOTFILES_ROOT/config/caelestia" "$CAELESTIA_TARGET"

echo "Hyprland and Caelestia configurations successfully installed!"
