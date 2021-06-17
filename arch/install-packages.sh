#!/usr/bin/env bash

sudo pacman -S --needed - < /home/chad/.dotfiles/arch/pkglist.txt

yay -S --needed --noconfirm - < /home/chad/.dotfiles/arch/foreignpkglist.txt
