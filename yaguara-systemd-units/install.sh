#!/usr/bin/env bash

source $HOME/.dotfiles/generic/shell/functions/colored_echos.sh
source $HOME/.dotfiles/generic/shell/functions/linkf.sh

parentServices=(app backend)
individualServices=(api api-watch websockets cronjobs etl mailer front-end)

allServices=("${parentServices[@]}")
allServices+=("${individualServices[@]}")

link() {
    linkf $HOME/.dotfiles/yaguara-systemd-units/"$1".service $HOME/.config/systemd/user/"$1".service
}

for service in "${allServices[@]}"
do
    link "$service"
done

systemctl --user daemon-reload

for service in "${individualServices[@]}"
do
    systemctl --user enable "$service"
done

