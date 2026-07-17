#!/bin/bash
# ~/.local/bin/qr-scan.sh

FILE="/tmp/qr_scan.png"

# Capture and scan
grim -g "$(slurp)" "$FILE"
RESULT=$(zbarimg -q --raw "$FILE")

# Handle result
if [ -n "$RESULT" ]; then
  # Copy to clipboard
  echo -n "$RESULT" | wl-copy

  # Check if the result looks like a URL
  if [[ "$RESULT" =~ ^http ]]; then
    xdg-open "$RESULT"
    notify-send "QR Scanner" "Detected URL: Opening..."
  else
    notify-send "QR Scanner" "Content copied to clipboard"
  fi
else
  notify-send "QR Scanner" "No code detected" -u low
fi

# Cleanup
rm -f "$FILE"
