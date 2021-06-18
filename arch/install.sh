#!/usr/bin/env bash

source $HOME/.dotfiles/generic/shell/functions/colored_echos.sh
source $HOME/.dotfiles/generic/shell/functions/linkf.sh

echo_info 'Installing bin files'

# Link all files in bin
for file in $HOME/.dotfiles/arch/bin/*;
    do
        filename=$(basename -- "$file");
        filename="${filename%.*}"
        chmod u+x $file
        linkf $file $HOME/.bin/$filename
done

tela="$HOME/src/Tela-icon-theme"
if [ ! -d $tela ]
then
    mkdir ~/src
    git clone git@github.com:vinceliuice/Tela-icon-theme.git $tpm
    /home/chad/src/Tela-icon-theme/install.sh
fi

archconf=$HOME/.dotfiles/arch/config
conf=$HOME/.config

echo_info 'Installing config'
linkf $archconf/dunstrc $conf/dunst/dunstrc
linkf $archconf/i3config $conf/i3/config
linkf $archconf/i3statusconfig $conf/i3status/config
linkf $archconf/gtk3_settings.ini $conf/gtk-3.0/settings.ini
linkf $archconf/gtkrc-2.0 $HOME/.gtkrc-2.0
linkf $archconf/polybar/config $conf/polybar/config
linkf $archconf/yay-config.json $conf/yay/config.json
linkf $archconf/picom.conf $conf/picom/picom.conf
linkf $archconf/fehbg $HOME/.fehbg
linkf $archconf/rofi-config.rasi $conf/rofi/config.rasi
linkf $archconf/py3status_module_presentation_mode.py $conf/py3status/modules/presentation_mode.py
linkf $archconf/kvantum/Dracula-purple-solid $conf/Kvantum/Dracula-purple-solid
linkf $archconf/kvantum/kvantum.kvconfig $conf/Kvantum/kvantum.kvconfig
linkf $HOME/.dotfiles/arch/themes/Dracula-gtk $HOME/.themes/Dracula
echo_success 'Config done'
