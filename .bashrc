set -o vi

alias ..='cd ..'
alias ...='cd ../..'

e() {
    $EDITOR $1
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[36m\]\u:\[\033[33;1m\]\w\[\033[m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "

# Setup fzf
[ -f $HOME/.fzf.bash ] && source ~/.fzf.bash

[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

export EDITOR='vim'

[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local

source $HOME/.dotfiles/.bashrc.common
