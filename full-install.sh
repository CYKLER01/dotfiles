#!/bin/bash
# ~/.local/bin/bootstrap.sh

echo "Starting system setup..."

./scripts/installation/pacman.sh
./scripts/installation/appimages.sh
./scripts/installation/lazyvim-install.sh
./scripts/installation/install-bash.sh
./scripts/installation/install-fuzzel.sh
./scripts/installation/install-config.sh
./scripts/installation/wallpapers.sh

echo "Bootstrap complete!"
