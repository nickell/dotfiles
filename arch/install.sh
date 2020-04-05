#!/usr/bin/env sh

source $HOME/.dotfiles/shell/functions/colored_echos.sh
source $HOME/.dotfiles/shell/functions/linkf.sh

# Link all files in bin
for file in $HOME/.dotfiles/arch/bin/*;
    do
        filename=$(basename -- "$file");
        chmod u+x $file
        linkf $file $HOME/.bin/$filename
done

# archconf=$HOME/.dotfiles/arch/config
# conf=$HOME/.config

# echo_info 'Installing'
# overwrite_all=false backup_all=false skip_all=false
# mkdir -p $HOME/.bin
# chmod u+x $HOME/.dotfiles/arch/conky-desktop.sh
# chmod u+x $HOME/.dotfiles/scripts/selection-to-clipboard.sh
# chmod u+x $HOME/.dotfiles/scripts/current-window-to-clipboard.sh
# linkf $archconf/i3config $conf/i3/config
# linkf $archconf/i3statusconfig $conf/i3status/config
# linkf $HOME/.dotfiles/scripts/selection-to-clipboard.sh $HOME/.bin/selection-to-clipboard.sh
# linkf $HOME/.dotfiles/scripts/current-window-to-clipboard.sh $HOME/.bin/current-window-to-clipboard.sh
# echo_success 'Done'
