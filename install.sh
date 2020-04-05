#!/usr/bin/env bash

source $HOME/.dotfiles/shell/functions/linkf.sh
source $HOME/.dotfiles/shell/functions/colored_echos.sh

prezto="$HOME/.zprezto"
tpm="$HOME/.tmux/plugins/tpm"
dotconf="$HOME/.dotfiles/config"
conf="$HOME/.config"

if [ ! -d $tpm ]
then
    git clone https://github.com/tmux-plugins/tpm $tpm
fi

if [ ! -d $prezto ]
then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git $prezto
fi

echo_info 'Installing dotfiles'
overwrite_all=false backup_all=false skip_all=false
linkf $dotconf/alacritty.yml $conf/alacritty/alacritty.yml
linkf $dotconf/aria2.conf $HOME/.aria2/aria2.conf
linkf $dotconf/gitconfig $HOME/.gitconfig
linkf $dotconf/htoprc $conf/htop/htoprc
linkf $dotconf/pgcliconfig $conf/pgcli/config
linkf $dotconf/psqlrc $HOME/.psqlrc
linkf $dotconf/rc.conf $conf/ranger/rc.conf
linkf $dotconf/rgignore $HOME/.rgignore
linkf $dotconf/sshconfig $HOME/.ssh/config
linkf $dotconf/tmux.conf $HOME/.tmux.conf
linkf $HOME/.dotfiles/shell/inputrc $HOME/.inputrc
linkf $HOME/.dotfiles/shell/zpreztorc $HOME/.zpreztorc
linkf $HOME/.dotfiles/shell/zshrc $HOME/.zshrc
echo_success 'Done'
