#!/bin/bash

# Ensure the fritid directory exists
if [ ! -d ~/.dotfiles/fritid ]; then
    echo "Error: ~/.dotfiles/fritid directory does not exist!"
    exit 1
fi

# Unstow everything from the work profile (if it exists)
if [ -d ~/.dotfiles/work ]; then
    for dir in ~/.dotfiles/work/*; do
        if [ -d "$dir" ]; then
            stow -D -d ~/.dotfiles/work -t ~ "$(basename "$dir")"
        fi
    done
fi

# Stow everything from the fritid profile
for dir in ~/.dotfiles/fritid/*; do
    if [ -d "$dir" ]; then
        stow -d ~/.dotfiles/fritid -t ~ "$(basename "$dir")"
    fi
done

echo "Switched to Fritid (Personal) profile"
