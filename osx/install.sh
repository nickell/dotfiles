#! /usr/bin/env sh

mkdir -p $HOME/Library/LaunchAgents
ln -s $HOME/.dotfiles/osx/local.startup.plist $HOME/Library/LaunchAgents
ln -s $HOME/.dotfiles/osx/local.api.plist $HOME/Library/LaunchAgents
ln -s $HOME/.dotfiles/osx/local.api-watch.plist $HOME/Library/LaunchAgents
ln -s $HOME/.dotfiles/osx/local.cronjobs.plist $HOME/Library/LaunchAgents
ln -s $HOME/.dotfiles/osx/local.etl.plist $HOME/Library/LaunchAgents
ln -s $HOME/.dotfiles/osx/local.front-end.plist $HOME/Library/LaunchAgents
ln -s $HOME/.dotfiles/osx/local.mailer.plist $HOME/Library/LaunchAgents
ln -s $HOME/.dotfiles/osx/local.websockets.plist $HOME/Library/LaunchAgents
