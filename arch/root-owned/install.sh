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

linkf /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/10-sub-pixel-rgb.conf
linkf /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/70-no-bitmaps.conf
linkf /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/11-lcdfilter-default.conf
# linkf $root_owned/fonts_local.conf /etc/fonts/local.conf

compare_and_copy () {
    if ! cmp -s $1 $2
    then
        cp $1 $2
        echo_success "copied $1 to $2"
    else
        echo_success "skipped $1"
    fi
}

# Sudo config
compare_and_copy $root_owned/sudoers_01_chad /etc/sudoers.d/01_chad
# Freetype config
compare_and_copy $root_owned/freetype2.sh /etc/profile.d/freetype2.sh

# Touchpad config
compare_and_copy $root_owned/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf

# Video driver config
# compare_and_copy $root_owned/20-intel.conf /etc/X11/xorg.conf.d/20-intel.conf

echo_success 'Done'
