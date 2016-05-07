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

export PATH="/Users/chad/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export EDITOR='vim'
export TERM="screen-256color"

source $ZSH/oh-my-zsh.sh

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Load fzf
export FZF_DEFAULT_COMMAND='ag --ignore ".*.swp" --hidden -l -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $HOME/.dotfiles/.zsh-prompt
source $HOME/.dotfiles/.zsh-functions

alias ll="ls -al"
alias bcodev="mosh chad@brllnt.co tmux a"
alias myserver="mosh chad@chadnickell.com tmux a"
alias inforvellor="ssh ec2-user@ec2-54-191-19-166.us-west-2.compute.amazonaws.com"
alias ns="npm start"
alias tm="tmux new -s main"
alias ga="git add ."
alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias gl="git log"

# Vim keybindings
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward
