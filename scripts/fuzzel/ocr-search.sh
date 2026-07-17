#!/bin/bash
# ~/.local/bin/ocr.sh

# Capture region
REGION=$(slurp)
[ -z "$REGION" ] && exit 0

# Capture and OCR
TEXT=$(grim -g "$REGION" - | tesseract stdin stdout -l eng | sed ':a;N;$!ba;s/\n/ /g' | sed 's/  */ /g')

# Copy to clipboard
if [ -n "$TEXT" ]; then
  echo "$TEXT" | wl-copy
  notify-send "OCR" "Text copied to clipboard"
else
  notify-send "OCR" "No text detected" -u low
fi
