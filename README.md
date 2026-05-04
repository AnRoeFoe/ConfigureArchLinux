# ConfigureArchLinux

Automated Arch Linux system configuration script that installs packages, development tools, and manages dotfiles via `stow`.

## Prerequisites

- Arch Linux installed using `archinstall` with **GNOME** selected as desktop environment
- `sudo` or root access
- Internet connection

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

## What It Does

- Installs system packages: **timeshift**, **neovim**, **firefox**, **base-devel**, **git**, **stow**, **gufw**
- Installs terminal tools: **kitty**, **starship**
- Sets up AUR helper (`yay`) and installs **visual-studio-code-bin**
- Clones and links dotfiles using `stow` for: neovim, starship, bash configuration

## Dotfiles Structure

Your dotfiles repository should be at `https://github.com/AnRoeFoe/dotfiles.git`:

```
dotfiles/
├── nvim/         # Neovim configuration
├── starship/     # Starship prompt configuration
└── bashrc/       # Bash configuration
```

## Notes

- AUR packages are built in `~/AUR`
- Dotfiles are cloned to `~/.repos/dotfiles`
- All `pacman` operations use `--noconfirm` for non-interactive installation

## License

See LICENSE file for details.