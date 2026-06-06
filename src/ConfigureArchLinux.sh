#!/bin/sh

sudo pacman --noconfirm -Sy snap-pac neovim base-devel stow less kitty starship ttf-firacode-nerd gufw

mkdir ~/AUR
cd ~/AUR
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si

yay --noconfirm -Sy visual-studio-code-bin zen-browser-bin

git clone https://github.com/AnRoeFoe/dotfiles.git ~/.repos/dotfiles
cd ~/.repos/dotfiles

rm -i ~/.bashrc

stow -t ~ starship
stow -t ~ bashrc
stow -t ~ kitty

git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim

