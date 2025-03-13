# Dotfiles with GNU Stow

## Installation

1. **Clone this repository** to your home directory:
   ```sh
   git clone https://github.com/stoffej/dotfiles.git ~/.dotfiles
   ```

2. **Install GNU Stow** (if not already installed):
   
   - Debian/Ubuntu:
     ```sh
     sudo apt install stow
     ```
   
### Stow files for fritid

```sh
stow -d ~/.dotfiles/fritid -t ~ .
```

### Stow files for work
```sh
stow -d ~/.dotfiles/work -t ~ .
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
  ~/.dotfiles/activate-fritid.sh
  ```

## Notes
- Ensure no conflicts between profiles when switching.
- Keep a backup of your original dotfiles before applying changes.
- You can add more profiles if needed (e.g., `gaming`, `server`).


### git local

git config --local user.name "Your Name"
git config --local user.email "your.email@example.com"
