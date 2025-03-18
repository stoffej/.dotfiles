#!/bin/bash

# Enable dotglob so that hidden files are expanded correctly
shopt -s dotglob

# Remove existing conflicting files and directories before unstowing
for file in ~/.dotfiles/fritid/*; do
    target=~/"$(basename "$file")"
    if [ -e "$target" ]; then
        rm -rf "$target"
    fi
done

# Disable dotglob to avoid unintended side effects in the shell
shopt -u dotglob

# Unstow work profile first
stow -D -d ~/.dotfiles/work -t ~ .

# Stow fritid profile
stow -d ~/.dotfiles/fritid -t ~ .

echo "Switched to Fritid (Personal) profile"
