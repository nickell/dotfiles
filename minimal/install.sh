#!/usr/bin/env bash

source $HOME/.dotfiles/shell/functions/linkf.sh
source $HOME/.dotfiles/shell/functions/colored_echos.sh

echo_info 'Installing dotfiles'
overwrite_all=false backup_all=false skip_all=false
linkf $HOME/.dotfiles/minimal/tmux.conf $HOME/.tmux.conf
linkf $HOME/.dotfiles/minimal/inputrc $HOME/.inputrc
linkf $HOME/.dotfiles/minimal/vimrc $HOME/.vimrc

cat $HOME/.dotfiles/minimal/bashrc >> $HOME/.bashrc

echo_success 'Done'
