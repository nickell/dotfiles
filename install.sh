#!/usr/bin/env bash

source $HOME/.dotfiles/scripts/link_file.sh
source $HOME/.dotfiles/scripts/colored_echos.sh

prezto="$HOME/.zprezto"
tpm="$HOME/.tmux/plugins/tpm"

if [ ! -d $tpm ]
then
    git clone https://github.com/tmux-plugins/tpm $tpm
fi

if [ ! -d $prezto ]
then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git $prezto
fi

info 'Installing dotfiles'
overwrite_all=false backup_all=false skip_all=false
link_file $HOME/.dotfiles/gitconfig $HOME/.gitconfig
link_file $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
link_file $HOME/.dotfiles/shell/zshrc $HOME/.zshrc
link_file $HOME/.dotfiles/shell/zpreztorc $HOME/.zpreztorc
link_file $HOME/.dotfiles/psqlrc $HOME/.psqlrc
mkdir -p $HOME/.config/pgcli
link_file $HOME/.dotfiles/pgcliconfig $HOME/.config/pgcli/config
link_file $HOME/.dotfiles/shell/inputrc $HOME/.inputrc
link_file $HOME/.dotfiles/rgignore $HOME/.rgignore
mkdir -p $HOME/.aria2
link_file $HOME/.dotfiles/aria2.conf $HOME/.aria2/aria2.conf
link_file $HOME/.dotfiles/sshconfig $HOME/.ssh/config

success 'Done'
