#!/bin/bash

ie# Enable dotglob so that hidden files are expanded correctly
shopt -s dotglob

# Remove existing conflicting files and directories before unstowing
for file in ~/.dotfiles/work/*; do
    target=~/"$(basename "$file")"
    if [ -e "$target" ]; then
        rm -rf "$target"
    fi
done

# Disable dotglob to avoid unintended side effects in the shell
shopt -u dotglob

# Unstow fritid profile first
stow -D -d ~/.dotfiles/fritid -t ~ .

# Stow work profile
stow -d ~/.dotfiles/work -t ~ .

echo "Switched to Work profile"
