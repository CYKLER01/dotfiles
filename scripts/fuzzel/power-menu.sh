#!/bin/bash
# ~/.local/bin/power-menu.sh

# Define your menu items
MENU_ITEMS="Google Lens
OCR Search
QR Scan
SSH Menu
ToDo List
---
Pick Color"

# Show fuzzel and get choice
CHOICE=$(echo -e "$MENU_ITEMS" | fuzzel --dmenu -p "Power Menu > ")

# Handle choice
case "$CHOICE" in
    "Google Lens") google-lens.sh ;;
    "OCR Search") ocr-search.sh ;;
    "QR Scan") qr-scan.sh ;;
    "SSH Menu") ssh-menu.sh ;;
    "Pick Color") hyprpicker -a ;;
    "To-Do List") todo.sh ;;
esac