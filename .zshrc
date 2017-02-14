HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep
zstyle :compinstall filename '/Users/chad/.zshrc'
autoload -Uz compinit
compinit

# Source Prezto.
[ -f $HOME/.zprezto/init.zsh ] && source $HOME/.zprezto/init.zsh

# Setup fzf
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

export EDITOR='vim'

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

source $HOME/.dotfiles/.zsh-functions
source $HOME/.dotfiles/.bashrc.common

[ -f $HOME/.zshrc.post-local ] && source $HOME/.zshrc.post-local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
