#!/bin/bash
# ~/.local/bin/install-config.sh

mkdir -p ~/.config/hypr

# Link Hyprland internal modules
ln -sf ~/dotfiles/config/hypr/hyprland/* ~/.config/hypr/
# Link main configs and schemes
ln -sf ~/dotfiles/config/hypr/*.lua ~/.config/hypr/
# Link Caelestia configs
ln -sf ~/dotfiles/config/caelestia/*.lua ~/.config/hypr/

echo "Hyprland and Caelestia configurations linked to ~/.config/hypr"
