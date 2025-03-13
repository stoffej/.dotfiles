#!/bin/bash

# Ensure the work directory exists
if [ ! -d ~/.dotfiles/work ]; then
    echo "Error: ~/.dotfiles/work directory does not exist!"
    exit 1
fi

# Unstow everything from the fritid profile (if it exists)
if [ -d ~/.dotfiles/fritid ]; then
    for dir in ~/.dotfiles/fritid/*; do
        if [ -d "$dir" ]; then
            stow -D -d ~/.dotfiles/fritid -t ~ "$(basename "$dir")"
        fi
    done
fi

# Stow everything from the work profile
for dir in ~/.dotfiles/work/*; do
    if [ -d "$dir" ]; then
        stow -d ~/.dotfiles/work -t ~ "$(basename "$dir")"
    fi
done

echo "Switched to Work profile"
