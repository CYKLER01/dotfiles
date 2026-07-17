#!/usr/bin/env bash
exec 2> /tmp/power-menu-debug.log
set -x
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
    "Google Lens") /home/cykler/.local/bin/google-lens.sh ;;
    "OCR Search")  /home/cykler/.local/bin/ocr-search.sh ;;
    "QR Scan")     /home/cykler/.local/bin/qr-scan.sh ;;
    "SSH Menu")    /home/cykler/.local/bin/ssh-menu.sh ;;
    "ToDo List")   /home/cykler/.local/bin/todo-list.sh ;;
    "Pick Color")  hyprpicker -a ;; # Or whatever command you use
esac