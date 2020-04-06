#!/usr/bin/env bash

source $HOME/.dotfiles/generic/shell/functions/colored_echos.sh
source $HOME/.dotfiles/generic/shell/functions/linkf.sh

root_owned=$HOME/.dotfiles/arch/root-owned

echo_info 'Installing root owned files'

# Reflector timer
linkf $root_owned/reflector.service /etc/systemd/system/reflector.service
if [ ! -f /etc/systemd/system/reflector.timer ]
then
    echo_info 'Linking reflector.timer and enabling it'
    linkf $root_owned/reflector.timer /etc/systemd/system/reflector.timer
    systemctl enable --now reflector.timer
fi

echo_success 'Done'
