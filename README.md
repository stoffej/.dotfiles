# Dotfiles with GNU Stow

This repository manages multiple profiles (e.g., `work` and `personal`) using **GNU Stow**. Each profile contains its own configurations, and you can easily switch between them.

## Installation

1. **Clone this repository** to your home directory:
   ```sh
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   ```

2. **Install GNU Stow** (if not already installed):
   
   - Debian/Ubuntu:
     ```sh
     sudo apt install stow
     ```
   - macOS (Homebrew):
     ```sh
     brew install stow
     ```
   - Arch Linux:
     ```sh
     sudo pacman -S stow
     ```
   
## Repository Structure

```
~/.dotfiles/
├── work/
│   ├── bash/
│   │   ├── .bashrc
│   │   ├── .bash_profile
│   ├── git/
│   │   ├── .gitconfig
├── personal/
│   ├── bash/
│   │   ├── .bashrc
│   │   ├── .bash_profile
│   ├── git/
│   │   ├── .gitconfig
├── activate-work.sh
├── activate-personal.sh
├── README.md
```

## Switching Profiles

### Activate Work Profile
```sh
stow -d ~/.dotfiles/work -t ~ bash git
```

### Activate Personal Profile
```sh
stow -d ~/.dotfiles/personal -t ~ bash git
```

### Switching Between Profiles
Before switching, **unstow** the current profile:

```sh
stow -D -d ~/.dotfiles/work -t ~ bash git  # Remove work profile
stow -d ~/.dotfiles/personal -t ~ bash git  # Apply personal profile
```

Alternatively, use the provided scripts:

#### **Using Scripts for Quick Switching**
Run the corresponding script to change profiles:

- **Switch to Work Profile:**
  ```sh
  ~/.dotfiles/activate-work.sh
  ```

- **Switch to Personal Profile:**
  ```sh
  ~/.dotfiles/activate-personal.sh
  ```

### Creating the Activation Scripts
If not included, create these scripts and make them executable.

#### `activate-work.sh`
```sh
#!/bin/bash
stow -D -d ~/.dotfiles/personal -t ~ bash git  # Unstow personal
stow -d ~/.dotfiles/work -t ~ bash git         # Stow work
echo "Switched to work profile"
```

#### `activate-personal.sh`
```sh
#!/bin/bash
stow -D -d ~/.dotfiles/work -t ~ bash git      # Unstow work
stow -d ~/.dotfiles/personal -t ~ bash git     # Stow personal
echo "Switched to personal profile"
```

Make them executable:
```sh
chmod +x ~/.dotfiles/activate-work.sh
chmod +x ~/.dotfiles/activate-personal.sh
```

## Syncing with GitHub
After making changes, push updates to GitHub:

```sh
cd ~/.dotfiles
git add .
git commit -m "Updated dotfiles"
git push origin main
```

## Notes
- Ensure no conflicts between profiles when switching.
- Keep a backup of your original dotfiles before applying changes.
- You can add more profiles if needed (e.g., `gaming`, `server`).


