#!/bin/bash
# ~/.local/bin/power-menu.sh

# Define your menu items
MENU_ITEMS="Google Lens
OCR Search
QR Scan
SSH Menu
---
Screenshot (Full)
Screenshot (Region)
Screenshot (Window)
Record (Select)
Record (Full)
Record (Region)
Pick Color"

# Show fuzzel and get choice
CHOICE=$(echo -e "$MENU_ITEMS" | fuzzel --dmenu -p "Power Menu > ")

# Handle choice
case "$CHOICE" in
    "Google Lens") google-lens.sh ;;
    "OCR Search") ocr-search.sh ;;
    "QR Scan") qr-scan.sh ;;
    "SSH Menu") ssh-menu.sh ;;
    "Screenshot (Full)") caelestia screenshot ;;
    "Screenshot (Region)") caelestia screenshotFreeze ;;
    "Screenshot (Window)") caelestia screenshot ;;
    "Record (Select)") caelestia record -s ;;
    "Record (Full)") caelestia record ;;
    "Record (Region)") caelestia record -r ;;
    "Pick Color") hyprpicker -a ;;
esac