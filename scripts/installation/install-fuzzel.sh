#!/bin/bash
# ~/.local/bin/install-fuzzel.sh

mkdir -p ~/.local/bin
ln -sf ~/dotfiles/scripts/fuzzel/* ~/.local/bin/
chmod +x ~/.local/bin/*.sh
echo "Fuzzel menu scripts installed to ~/.local/bin"
