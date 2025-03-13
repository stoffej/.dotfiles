#!/bin/bash


# Remove existing conflicting files before unstowing
for file in ~/.dotfiles/work/.*; do
    [ -f "$file" ] && rm -f ~/"$(basename "$file")"
done

# Unstow fritid profile first
stow -D -d ~/.dotfiles/fritid -t ~ .

# Stow work profile
stow -d ~/.dotfiles/work -t ~ .

echo "Switched to Work profile"
