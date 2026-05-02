#!/bin/sh

pacman --noconfirm -S timeshift neovim firefox base-devel git stow
pacman --noconfirm -S kitty starship

mkdir ~/AUR
cd ~/AUR
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si

yay -Sy visual-studio-code-bin

git clone https://github.com/AnRoeFoe/dotfiles.git ~/.repos/dotfiles
cd ~/.repos/dotfiles
stow -t ~ nvim
stow -t ~ kitty
stow -t ~ starship
stow -t ~ bashrc
