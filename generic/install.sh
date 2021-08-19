#!/usr/bin/env bash

source $HOME/.dotfiles/generic/shell/functions/linkf.sh
source $HOME/.dotfiles/generic/shell/functions/colored_echos.sh

prezto="$HOME/.zprezto"
tpm="$HOME/.tmux/plugins/tpm"
vim_plug="$HOME/.local/share/nvim/site/autoload/plug.vim"
dotconf="$HOME/.dotfiles/generic/config"
conf="$HOME/.config"

if [ ! -d $tpm ]
then
    git clone https://github.com/tmux-plugins/tpm $tpm
fi

if [ ! -d $prezto ]
then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git $prezto
fi

if [ ! -f "$vim_plug" ]
then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

mkdir -p $HOME/.bin

echo_info 'Installing dotfiles'
linkf $dotconf/alacritty.yml $conf/alacritty/alacritty.yml
linkf $HOME/.dotfiles/vim/coc-settings.json $conf/nvim/coc-settings.json
linkf $dotconf/aria2.conf $HOME/.aria2/aria2.conf
linkf $dotconf/gitconfig $HOME/.gitconfig
linkf $dotconf/htoprc $conf/htop/htoprc
linkf $dotconf/pgcliconfig $conf/pgcli/config
linkf $dotconf/psqlrc $HOME/.psqlrc
linkf $dotconf/rc.conf $conf/ranger/rc.conf
linkf $dotconf/rifle.conf $conf/ranger/rifle.conf
linkf $dotconf/rgignore $HOME/.rgignore
linkf $dotconf/sshconfig $HOME/.ssh/config
linkf $dotconf/tmux.conf $HOME/.tmux.conf
linkf $HOME/.dotfiles/generic/shell/inputrc $HOME/.inputrc
linkf $HOME/.dotfiles/generic/shell/zpreztorc $HOME/.zpreztorc
linkf $HOME/.dotfiles/generic/shell/zshrc $HOME/.zshrc
linkf $HOME/.dotfiles/generic/shell/zlogin $HOME/.zlogin
linkf $HOME/.dotfiles/generic/shell/zshenv $HOME/.zshenv
linkf $HOME/.dotfiles/vim/init.vim $conf/nvim/init.vim
echo_success 'Done'
