#!/bin/bash

source $HOME/.dotfiles/scripts/link_file.sh
source $HOME/.dotfiles/scripts/colored_echos.sh
source $HOME/.dotfiles/scripts/install_zsh.sh
source $HOME/.dotfiles/scripts/install_ag.sh

install_zsh
install_ag

vimPlug="$HOME/.vim/autoload/plug.vim"
nvm="$HOME/.nvm"

if [ ! -f $vimPlug ]
then
    curl -fLo $vimPlug --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -d $nvm ]
then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
fi

info 'Installing dotfiles'
link_file $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc
link_file $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
link_file $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
link_file $HOME/.dotfiles/.zshrc $HOME/.zshrc
link_file $HOME/.dotfiles/.bashrc $HOME/.bashrc

cp $HOME/.dotfiles/.gitconfig.local.example $HOME/.gitconfig.local

success 'Done'
