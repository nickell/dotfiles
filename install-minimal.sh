#!/usr/bin/env bash

source $HOME/.dotfiles/scripts/link_file.sh
source $HOME/.dotfiles/scripts/colored_echos.sh

info 'Installing dotfiles'
overwrite_all=false backup_all=false skip_all=false
link_file $HOME/.dotfiles/minimal/.tmux.conf $HOME/.tmux.conf
link_file $HOME/.dotfiles/minimal/inputrc $HOME/.inputrc
link_file $HOME/.dotfiles/minimal/.vimrc $HOME/.vimrc

cat $HOME/.dotfiles/minimal/.bashrc >> $HOME/.bashrc

success 'Done'
