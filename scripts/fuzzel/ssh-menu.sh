#!/bin/bash
# ~/.local/bin/ssh-menu.sh

host=$(grep "^Host " ~/.ssh/config | awk '{print $2}' | fuzzel -d -p "SSH to: ")

if [ -n "$host" ]; then
  kitty -e ssh "$host"
fi
