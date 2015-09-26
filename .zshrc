# vim: set fdm=marker fmr={{{,}}}:

export ZSH=$HOME/.oh-my-zsh

# {{{ ZSH Config
# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git sudo tmux wd)
source $ZSH/oh-my-zsh.sh
autoload -U zmv
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward
# }}}

# {{{ Exports
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export EDITOR='vim'
# }}}

# {{{ Aliases
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias ll="ls -al"
alias mmv='noglob zmv -W'
# }}}

# {{{ Functions
minvim () { vim -u ~/.dotfiles/.minimal-vimrc $1 }
blankvim () { vim -u NORC $1 }
vims () { vim -S ~/.vim/sessions/$1.vim }

devenv() {
    if sessionExists $1; then
        echo 'Session already exists'
    else
        startMongo

        WORKING_DIR="$(wd path $1)"

        tmux new-session -c ${~WORKING_DIR} -d -s $1 -n vim

        tmux send-keys -t $1:vim "vims $1" C-m

        tmux attach-session -t $1
    fi
}

killToNextTmux() {
    CURRENT_SESSION="$(tmux display-message -p '#S')"

    if ! (tmux switch-client -n >/dev/null 2>&1); then
        # there were no other clients
        tmux kill-session
    else
        # there was another client
        tmux kill-session -t $CURRENT_SESSION
    fi
}
# }}}

# {{{ Prompt
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

# {{{ Helper functions
startMongo() {
    MONGO_STARTED="$(ps aux | ag mongod | wc -l)"

    # If mongo isn't started
    if [ $MONGO_STARTED -ne 2 ]; then

        # Wait until mongo logs that it's ready (or timeout after 5s)
        touch ~/.logs/mongodb.log
        ORIGINAL_RESULT_COUNT="$(ag 'waiting for connections' ~/.logs/mongodb.log | wc -l)"
        RESULT_COUNT=$ORIGINAL_RESULT_COUNT
        mongod --quiet --logpath ~/.logs/mongodb.log --logappend &
        COUNTER=0

        while [ $RESULT_COUNT -eq $ORIGINAL_RESULT_COUNT ] ; do
            if [ $COUNTER -ge 5 ]; then
                echo "Mongo didn't start for 5 seconds"
                kill -s TERM $TOP_PID
            fi
            sleep 1
            let COUNTER+=1
            echo "Waiting for mongo to initialize... ($COUNTER seconds so far)"
            RESULT_COUNT="$(ag 'waiting for connections' ~/.logs/mongodb.log | wc -l)"
        done
    fi

    echo "Mongo is started"
}

stopMongo() {
    MONGO_STARTED="$(ps aux | ag mongod | wc -l)"

    if [ $MONGO_STARTED -eq 2 ]; then
        killall mongod
    fi
}

sessionExists() {
    EXISTING_SESSION=$(tmux ls 2> /dev/null | ag -w $1 | wc -l)

    if [ $EXISTING_SESSION -eq 1 ]; then
        return 0 #true
    else
        return 1 #false
    fi
}

gitDirty() {
    test -n "$(git status --porcelain)"
}
# }}}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --ignore ".*.swp" --hidden -l -g ""'
