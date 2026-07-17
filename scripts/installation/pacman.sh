#!/bin/bash
# Update system first
sudo pacman -Syu --noconfirm

# Install packages
sudo pacman -S --noconfirm \
  hyprland kitty fish neovim git ufw \
  ttf-jetbrains-mono-nerd tesseract-data-eng \
  vlc obs-studio zen-browser-bin brave-bin \
  vesktop telegram-desktop steam \
  btop tree npm
