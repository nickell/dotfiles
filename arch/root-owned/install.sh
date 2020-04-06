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
else 
    echo_success "skipped $root_owned/reflector.timer"
fi

# Sudo config
if ! cmp -s $root_owned/sudoers_01_chad /etc/sudoers.d/01_chad
then
    cp $root_owned/sudoers_01_chad /etc/sudoers.d/01_chad
    echo_success "copied $root_owned/sudoers_01_chad to /etc/sudoers.d/01_chad"
else 
    echo_success "skipped $root_owned/sudoers_01_chad"
fi

echo_success 'Done'
