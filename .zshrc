HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=100
setopt appendhistory autocd extendedglob nomatch hist_ignore_dups
unsetopt beep

# Source Prezto.
[ -f $HOME/.zprezto/init.zsh ] && source $HOME/.zprezto/init.zsh

export EDITOR='vim'

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

source $HOME/.dotfiles/.zsh-functions
source $HOME/.dotfiles/.bashrc.common

[ -f $HOME/.zshrc.post-local ] && source $HOME/.zshrc.post-local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
