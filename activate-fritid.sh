#!/bin/bash
#!/bin/bash

# Ensure the fritid directory exists
if [ ! -d ~/.dotfiles/fritid ]; then
    echo "Error: ~/.dotfiles/fritid directory does not exist!"
    exit 1
fi

# Remove existing conflicting files before unstowing
for file in ~/.dotfiles/fritid/.*; do
    [ -f "$file" ] && rm -f ~/"$(basename "$file")"
done

# Unstow work profile first
stow -D -d ~/.dotfiles/work -t ~ .

# Stow fritid profile
stow -d ~/.dotfiles/fritid -t ~ .

echo "Switched to Fritid (Personal) profile"
