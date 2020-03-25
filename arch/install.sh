#!/usr/bin/env sh

source $HOME/.dotfiles/scripts/colored_echos.sh
source $HOME/.dotfiles/scripts/link_file.sh

info 'Installing'
overwrite_all=false backup_all=false skip_all=false
mkdir -p $HOME/.bin
chmod u+x $HOME/.dotfiles/arch/conky-desktop.sh
chmod u+x $HOME/.dotfiles/scripts/selection-to-clipboard.sh
chmod u+x $HOME/.dotfiles/scripts/current-window-to-clipboard.sh
link_file $HOME/.dotfiles/arch/i3config $HOME/.i3/config
mkdir -p $HOME/.config/i3status
link_file $HOME/.dotfiles/arch/i3statusconfig $HOME/.config/i3status/config
link_file $HOME/.dotfiles/scripts/selection-to-clipboard.sh $HOME/.bin/selection-to-clipboard.sh
link_file $HOME/.dotfiles/scripts/current-window-to-clipboard.sh $HOME/.bin/current-window-to-clipboard.sh
