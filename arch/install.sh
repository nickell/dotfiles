#!/usr/bin/env bash

source $HOME/.dotfiles/generic/shell/functions/colored_echos.sh
source $HOME/.dotfiles/generic/shell/functions/linkf.sh

echo_info 'Installing bin files'

echo_info 'Installing config'
linkf $HOME/.dotfiles/arch/themes/Dracula-gtk $HOME/.themes/Dracula
echo_success 'Config done'
