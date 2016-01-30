export ZSH=/Users/chad/.oh-my-zsh

ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
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

# Vim keybindings
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward

export PATH="/Users/chad/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export EDITOR='vim'

source $ZSH/oh-my-zsh.sh

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Load fzf
export FZF_DEFAULT_COMMAND='ag --ignore ".*.swp" --hidden -l -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $HOME/.dotfiles/.zsh-prompt

alias ll="ls -al"
alias bcodev="mosh chad@brllnt.co tmux a"
alias myserver="mosh chad@chadnickell.com tmux a"
