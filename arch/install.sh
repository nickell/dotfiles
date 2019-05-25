#!/usr/bin/env sh

source $HOME/.dotfiles/scripts/link_file.sh

link_file $HOME/.dotfiles/scripts/change-wallpaper.sh $HOME/.bin/change-wallpaper
link_file $HOME/.dotfiles/arch/i3config $HOME/.i3/config
mkdir -p $HOME/.config/i3status
link_file $HOME/.dotfiles/arch/i3statusconfig $HOME/.config/i3status/config
