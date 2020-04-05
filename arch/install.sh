#!/usr/bin/env sh

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

archconf=$HOME/.dotfiles/arch/config
conf=$HOME/.config

echo_info 'Installing config'
overwrite_all=false backup_all=false skip_all=false
linkf $archconf/dunstrc $conf/dunst/dunstrc
linkf $archconf/i3config $conf/i3/config
linkf $archconf/i3statusconfig $conf/i3status/config
echo_success 'Done'
