# ConfigureArchLinux

An automated Arch Linux system configuration script that sets up essential packages, development tools, and dotfiles management.

## Overview

This script automates the initial setup of an Arch Linux system by installing commonly used packages, development tools, and setting up dotfiles using `stow` for configuration management.

## Features

- Installs essential packages and utilities
- Sets up development environment with build tools
- Installs AUR helper (`yay`)
- Installs additional tools from AUR (Visual Studio Code)
- Automatically clones and configures dotfiles
- Uses `stow` for elegant configuration file management

## Prerequisites

- Arch Linux system
- `sudo` or root access (required for `pacman` operations)
- Internet connection
- Git installed (typically pre-installed on Arch)

## Packages Installed

### System Packages
- **timeshift** - System backup and restore utility
- **neovim** - Modern text editor
- **firefox** - Web browser
- **base-devel** - Development tools and compilers
- **git** - Version control system
- **stow** - Configuration file symlink manager

### Terminal & Shell
- **kitty** - Modern terminal emulator
- **starship** - Cross-shell prompt

### AUR Packages
- **yay** - AUR helper for package management
- **visual-studio-code-bin** - VS Code IDE

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/AnRoeFoe/ConfigureArchLinux.git
   cd ConfigureArchLinux
   ```

2. Run the setup script:
   ```bash
   ./src/ConfigureArchLinux.sh
   ```

## What the Script Does

1. Installs system packages using `pacman`
2. Installs terminal emulator (`kitty`) and shell prompt (`starship`)
3. Sets up AUR by cloning and building `yay`
4. Installs VS Code from AUR via `yay`
5. Clones your dotfiles repository from GitHub
6. Uses `stow` to symlink configuration files for:
   - neovim
   - kitty
   - starship
   - bash configuration

## Configuration

Your dotfiles should be organized in a repository at `https://github.com/AnRoeFoe/dotfiles.git` with the following structure:

```
dotfiles/
├── nvim/         # Neovim configuration
├── kitty/        # Kitty terminal configuration
├── starship/     # Starship prompt configuration
└── bashrc/       # Bash configuration
```

## Notes

- The script creates an `AUR` directory in your home folder for building AUR packages
- Dotfiles are cloned to `~/.repos/dotfiles`
- All `pacman` operations use `--noconfirm` flag for non-interactive installation
- Requires an active internet connection throughout execution

## License

See LICENSE file for details.