#!/bin/sh

sudo dnf install kitty neovim stow fastfetch

sudo dnf copr enable atim/starship
sudo dnf install starship

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code

mkdir -p ~/.bashrc.d
cp src/fedora/bashrc.d/* ~/.bashrc.d/

git clone https://github.com/AnRoeFoe/dotfiles.git ~/.repositories/dotfiles
cd ~/.repositories/dotfiles

stow -t ~ starship
stow -t ~ kitty
stow -t ~ inputrc

git clone https://github.com/LazyVim/starter ~/.config/nvim