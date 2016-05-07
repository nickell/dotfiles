#!/bin/bash

source $HOME/.dotfiles/scripts/link_file.sh
source $HOME/.dotfiles/scripts/colored_echos.sh

vimPlug="$HOME/.vim/autoload/plug.vim"

if [ ! -f $vimPlug ]
then
    curl -fLo $vimPlug --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

info 'Installing dotfiles'
link_file $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc
link_file $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
link_file $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf

cp $HOME/.dotfiles/.gitconfig.local.example $HOME/.gitconfig.local

success 'Done'
