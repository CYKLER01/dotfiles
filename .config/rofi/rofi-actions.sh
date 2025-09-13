#!/bin/bash

# Define the actions and their corresponding commands
declare -A actions=(
    ["Terminal"]="~/.config/ml4w/settings/terminal.sh"
    ["Browser"]="~/.config/ml4w/settings/browser.sh"
    ["File Manager"]="~/.config/ml4w/settings/filemanager.sh"
    ["Kill Active Window"]="hyprctl dispatch killactive"
    ["Fullscreen Window"]="hyprctl dispatch fullscreen 0"
    ["Power Menu"]="~/.config/ml4w/scripts/wlogout.sh"
    ["Wallpaper Selector"]="waypaper"
    ["Change Wallpaper"]="~/.config/hypr/scripts/set_wallpaper.sh"
    ["Reload Waybar"]="~/.config/waybar/launch.sh"
    ["Toggle Game Mode"]="~/.config/hypr/scripts/gamemode.sh"
    ["Lockscreen"]="~/.config/hypr/scripts/power.sh lock"
    ["Rofi Checklist"]="rofi -modi \"general-todo:~/.local/bin/Rofi-Todolist/todolist general\" -show general-todo"
    ["Rofi Calculator"]="rofi -show calc -modi calc -no-show-match -no-sort -calc-command \"echo -n '{result}' | xclip\""
    ["Region Screenshot"]="~/.local/bin/hyprshot -m region -o ~/Pictures/screenshots"
    ["Rofi Clipboard"]="cliphist list | rofi -dmenu | cliphist decode | wl-copy"
    ["Rofi SSH Menu"]="rofi -show ssh"
    ["Show Keybindings"]="~/.config/ml4w/scripts/keybindings.sh"
    ["Windscribe Connect"]="windscribe-cli connect best"
    ["Windscribe Disconnect"]="windscribe-cli disconnect && pkill windscribe-cli"
    ["windscribe Status"]="kitty --hold windscribe-cli status"
)

# Generate the list of keys for Rofi
options=$(printf "%s\n" "${!actions[@]}")

# Display the menu with Rofi and get the user's choice
choice=$(echo -e "$options" | rofi -dmenu -i -p "Actions:")

# Execute the command associated with the chosen action
if [[ -n "$choice" ]]; then
    eval "${actions[$choice]}"
fi
