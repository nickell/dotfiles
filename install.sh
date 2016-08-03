#!/bin/bash

source $HOME/.dotfiles/scripts/link_file.sh
source $HOME/.dotfiles/scripts/colored_echos.sh
source $HOME/.dotfiles/scripts/install_zsh.sh
source $HOME/.dotfiles/scripts/install_ag.sh
source $HOME/.dotfiles/scripts/install_fasd.sh

# Work on installing ranger automatically too

install_zsh
install_ag
install_fasd

vimPlug="$HOME/.vim/autoload/plug.vim"
prezto="$HOME/.zprezto"

if [ ! -f $vimPlug ]
then
    curl -fLo $vimPlug --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -d "$HOME/.nvm" ]
then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ ! -d $prezto ]
then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git $prezto
fi

info 'Installing dotfiles'
overwrite_all=false backup_all=false skip_all=false
link_file $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc
link_file $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
link_file $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
link_file $HOME/.dotfiles/.zshrc $HOME/.zshrc
link_file $HOME/.dotfiles/.bashrc $HOME/.bashrc
link_file $HOME/.dotfiles/rc.conf $HOME/.config/ranger/rc.conf
link_file $HOME/.dotfiles/rifle.conf $HOME/.config/ranger/rifle.conf
link_file $HOME/.zprezto/runcoms/zlogin $HOME/.zlogin
link_file $HOME/.zprezto/runcoms/zlogout $HOME/.zlogout
link_file $HOME/.zprezto/runcoms/zprofile $HOME/.zprofile
link_file $HOME/.zprezto/runcoms/zshenv $HOME/.zshenv
link_file $HOME/.dotfiles/.zpreztorc $HOME/.zpreztorc

success 'Done'
