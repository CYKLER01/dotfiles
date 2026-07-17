#!/bin/bash
# ~/.local/bin/install-bash.sh

mkdir -p ~/.local/bin
ln -sf ~/dotfiles/scripts/bash/* ~/.local/bin/
chmod +x ~/.local/bin/cpcpl ~/.local/bin/pscpl
echo "Bash utilities installed to ~/.local/bin"
