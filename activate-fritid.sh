#!/bin/bash


# Remove existing conflicting files before unstowing
for file in ~/.dotfiles/fritid/.*; do
    [ -f "$file" ] && rm -f ~/"$(basename "$file")"
done

# Unstow work profile first
stow -D -d ~/.dotfiles/work -t ~ .

# Stow fritid profile
stow -d ~/.dotfiles/fritid -t ~ .

echo "Switched to Fritid (Personal) profile"
