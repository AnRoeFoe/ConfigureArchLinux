#!/bin/sh

sudo pacman --noconfirm -S timeshift neovim firefox base-devel stow less kitty starship ttf-firacode-nerd gufw

mkdir ~/AUR
cd ~/AUR
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si

yay -Sy visual-studio-code-bin

git clone https://github.com/AnRoeFoe/dotfiles.git ~/.repos/dotfiles
cd ~/.repos/dotfiles

rm -i ~/.bashrc

stow -t ~ nvim
stow -t ~ starship
stow -t ~ bashrc
stow -t ~ kitty
