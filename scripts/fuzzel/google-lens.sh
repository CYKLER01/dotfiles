#!/bin/bash
# ~/.local/bin/lens.sh

IMAGE="/tmp/image.png"

# Capture area
grim -g "$(slurp)" "$IMAGE"

# Upload and parse the URL
response=$(curl -s -F "files[]=@$IMAGE" https://uguu.se/upload.php)
url=$(echo "$response" | jq -r '.files[0].url')

# Open in Lens and notify
if [ -n "$url" ]; then
  xdg-open "https://lens.google.com/uploadbyurl?url=${url}"
  notify-send "Google Lens" "Analysis complete"
else
  notify-send "Google Lens" "Upload failed"
fi

# Clean up
rm -f "$IMAGE"
