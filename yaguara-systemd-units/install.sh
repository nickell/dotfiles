#!/usr/bin/env bash

parentServices=(app backend)
individualServices=(api api-watch websockets cronjobs etl mailer front-end profectus schemas)

allServices=("${parentServices[@]}")
allServices+=("${individualServices[@]}")

link() {
    ln -sf $HOME/.dotfiles/yaguara-systemd-units/"$1".service $HOME/.config/systemd/user/"$1".service
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

