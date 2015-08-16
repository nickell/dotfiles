# vim: set fdm=marker fmr={{{,}}}:

export ZSH=$HOME/.oh-my-zsh

# {{{ ZSH Config
# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git sudo tmux wd)
autoload -U zmv
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward
# }}}

# {{{ Exports
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export EDITOR='vim'
# }}}

# {{{ Aliases and functions
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias ll="ls -al"
alias mmv='noglob zmv -W'
minvim () { vim -u ~/.dotfiles/.minimal-vimrc $1 }
# }}}

# {{{ Prompt
source $ZSH/oh-my-zsh.sh

vim_ins_mode="%{$fg[cyan]%}[I]%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}[C]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
# Thanks Ron! (see comments)
function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}

PROMPT+='${vim_mode} '
# }}}

source $HOME/.dotfiles-local/.zshrc-after
