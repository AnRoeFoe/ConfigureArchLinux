#!/bin/sh

# This script sets up a fresh Fedora system with the terminal and editor
# tools I use most often, then installs my personal shell and Git config.

# Install the core CLI and terminal utilities used for daily work.
sudo dnf install kitty neovim stow fastfetch keepassxc

# Add the Starship prompt repository and install the prompt itself.
sudo dnf copr enable atim/starship
sudo dnf install starship

# Configure the Microsoft package repository so VS Code can be installed
# via Fedora's package manager.
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

# Refresh metadata and install the editor itself.
dnf check-update
sudo dnf install code

# Copy the repository-local bash customizations into the user's shell config.
mkdir -p ~/.bashrc.d
cp bashrc.d/* ~/.bashrc.d/

# Clone the personal dotfiles repo and apply the relevant stow-managed configs.
git clone https://github.com/AnRoeFoe/dotfiles.git ~/.repositories/dotfiles
cd ~/.repositories/dotfiles

stow -t ~ starship
stow -t ~ kitty
stow -t ~ inputrc

# Install the LazyVim starter configuration for Neovim.
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Set the global Git identity used for commits on this machine.
git config --global user.name "Max Mustermann"
git config --global user.email "max.mustermann@web.de"

# Download and install the FiraCode Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/FiraCode.zip
mkdir -p ~/.local/share/fonts/FiraCode
unzip FiraCode.zip -d ~/.local/share/fonts/FiraCode
fc-cache -fv
rm FiraCode.zip