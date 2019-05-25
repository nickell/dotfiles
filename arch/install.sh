#!/usr/bin/env sh

source $HOME/.dotfiles/scripts/colored_echos.sh
source $HOME/.dotfiles/scripts/link_file.sh

info 'Installing'
overwrite_all=false backup_all=false skip_all=false
mkdir -p $HOME/.bin
chmod u+x $HOME/.dotfiles/arch/change-wallpaper.sh
link_file $HOME/.dotfiles/arch/change-wallpaper.sh $HOME/.bin/change-wallpaper
link_file $HOME/.dotfiles/arch/i3config $HOME/.i3/config
mkdir -p $HOME/.config/i3status
link_file $HOME/.dotfiles/arch/i3statusconfig $HOME/.config/i3status/config
