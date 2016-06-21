#!/bin/bash

source $HOME/.dotfiles/scripts/link_file.sh
source $HOME/.dotfiles/scripts/colored_echos.sh
source $HOME/.dotfiles/scripts/install_zsh.sh
source $HOME/.dotfiles/scripts/install_ag.sh

# Work on installing ranger automatically too

install_zsh
install_ag

vimPlug="$HOME/.vim/autoload/plug.vim"
nvm="$HOME/.nvm"
tpm="$HOME/.tmux/plugins/tpm"

if [ ! -f $vimPlug ]
then
    curl -fLo $vimPlug --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -d $nvm ]
then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
fi

if [ ! -d $tpm ]
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

info 'Installing dotfiles'
link_file $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc
link_file $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
link_file $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
link_file $HOME/.dotfiles/.zshrc $HOME/.zshrc
link_file $HOME/.dotfiles/.bashrc $HOME/.bashrc
link_file $HOME/.dotfiles/rc.conf $HOME/.config/ranger/rc.conf
link_file $HOME/.dotfiles/rifle.conf $HOME/.config/ranger/rifle.conf
# link_file $HOME/.dotfiles/robbyrussell.zsh-theme $ZSH/custom/themes/robbyrussell.zsh-theme

success 'Done'
