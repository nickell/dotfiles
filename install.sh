#!/usr/bin/env bash

source $HOME/.dotfiles/scripts/link_file.sh
source $HOME/.dotfiles/scripts/colored_echos.sh
source $HOME/.dotfiles/scripts/install_zsh.sh

install_zsh

vimPlug="$HOME/.local/share/nvim/site/autoload/plug.vim"
prezto="$HOME/.zprezto"
tpm="$HOME/.tmux/plugins/tpm"

if [ ! -f $vimPlug ]
then
    curl -fLo $vimPlug --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -d "$HOME/.nvm" ]
then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
fi

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
link_file $HOME/.dotfiles/vim/init.vim $HOME/.config/nvim/init.vim
link_file $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
link_file $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
link_file $HOME/.dotfiles/shell/zshrc $HOME/.zshrc
link_file $HOME/.dotfiles/shell/zpreztorc $HOME/.zpreztorc
link_file $HOME/.dotfiles/.psqlrc $HOME/.psqlrc
link_file $HOME/.dotfiles/pgcliconfig $HOME/.config/pgcli/config
link_file $HOME/.dotfiles/shell/inputrc $HOME/.inputrc
link_file $HOME/.dotfiles/.rgignore $HOME/.rgignore

success 'Done'
