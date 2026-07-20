#!/usr/bin/env bash
set -euo pipefail

NVIM_DIR="$HOME/.config/nvim"

#backup
if [ -d "$NVIM_DIR" ] && [ ! -L "$NVIM_DIR" ]; then
  echo "Backing up existing Neovim configuration..."
  rm -rf "${NVIM_DIR}.bak"
  mv "$NVIM_DIR" "${NVIM_DIR}.bak"
fi

# Remove any existing symlink if it points elsewhere
[ -L "$NVIM_DIR" ] && rm -f "$NVIM_DIR"

echo "Cloning LazyVim starter..."
git clone https://github.com/LazyVim/starter "$NVIM_DIR"

# Remove .git so it's a clean slate for your own use/tracking
rm -rf "$NVIM_DIR/.git"

echo "LazyVim successfully installed to $NVIM_DIR"
