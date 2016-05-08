export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
plugins=(git z)
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep
zstyle :compinstall filename '/Users/chad/.zshrc'
autoload -Uz compinit
compinit

source $ZSH/oh-my-zsh.sh

# Setup fzf
[ -f $HOME/.fzf.zsh ] && source ~/.fzf.zsh

# Vim keybindings
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward

source $HOME/.dotfiles/.zsh-prompt
source $HOME/.dotfiles/.zsh-functions
source $HOME/.dotfiles/.bashrc.common

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
