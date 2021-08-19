#!/usr/bin/env bash

source $HOME/.dotfiles/generic/shell/functions/colored_echos.sh
source $HOME/.dotfiles/generic/shell/functions/linkf.sh

echo_info 'Installing dotfiles'
linkf $HOME/.dotfiles/minimal/tmux.conf $HOME/.tmux.conf
linkf $HOME/.dotfiles/minimal/inputrc $HOME/.inputrc
linkf $HOME/.dotfiles/minimal/vimrc $HOME/.vimrc

cat $HOME/.dotfiles/minimal/bashrc >> $HOME/.bashrc

echo_success 'Done'
