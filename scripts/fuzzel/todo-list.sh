#!/bin/bash
# ~/.local/bin/todo.sh

CONFIG_DIR="$HOME/.local/share/todo-fuzzel"
CACHE_FILE="$CONFIG_DIR/todo.cache"
mkdir -p "$CONFIG_DIR"
touch "$CACHE_FILE"

# Prepare options: "Add New" + current tasks
selection=$( (echo "[+] Add New Task"; cat "$CACHE_FILE") | fuzzel --dmenu -p "To-Do: ")

[ -z "$selection" ] && exit 1

if [ "$selection" = "[+] Add New Task" ]; then
    # Prompt for new task
    new_task=$(echo "" | fuzzel --dmenu -p "New Task: ")
    [ -n "$new_task" ] && echo "$new_task" >> "$CACHE_FILE"
elif grep -Fxq "$selection" "$CACHE_FILE"; then
    # If it exists, remove it (mark as done)
    grep -vFx "$selection" "$CACHE_FILE" > "$CONFIG_DIR/todo.tmp" && mv "$CONFIG_DIR/todo.tmp" "$CACHE_FILE"
fi