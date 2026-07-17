#!/bin/bash

# backup
mv ~/.config/nvim{,.bak}

# clone
git clone https://github.com/LazyVim/starter ~/.config/nvim

# remove .git
rm -rf ~/.config/nvim/.git
