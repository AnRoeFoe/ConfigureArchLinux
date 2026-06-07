#!/bin/sh

sudo pacman --noconfirm -Sy neovim base-devel stow less kitty starship ttf-firacode-nerd gufw zellij secrets throttled helvum

mkdir ~/AUR
cd ~/AUR
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si

yay --noconfirm -Sy visual-studio-code-bin zen-browser-bin fastfetch klick

git clone https://github.com/AnRoeFoe/dotfiles.git ~/.repos/dotfiles
cd ~/.repos/dotfiles

rm -i ~/.bashrc

stow -t ~ starship
stow -t ~ bashrc
stow -t ~ kitty
stow -t ~ inputrc

git clone https://github.com/LazyVim/starter ~/.config/nvim

sudo systemctl enable --now throttled.service
sudo systemctl enable --now cronie.service
