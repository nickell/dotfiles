#!/bin/bash

linkf () {
    local src=$1 dst=$2

    local overwrite= backup= skip=
    local action=

    local dir=$(dirname "${2}")

    mkdir -p $dir

    if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
    then

        if [ -z "$overwrite_all" ] && [ -z "$backup_all" ] && [ -z "$skip_all" ]
        then

            local currentSrc="$(readlink $dst)"

            if [ "$currentSrc" == "$src" ]
            then

                skip=true;

            else

                echo_user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
                    [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
                read -n 1 action

                case "$action" in
                    o )
                        overwrite=true;;
                    O )
                        overwrite_all=true;;
                    b )
                        backup=true;;
                    B )
                        backup_all=true;;
                    s )
                        skip=true;;
                    S )
                        skip_all=true;;
                    * )
                        ;;
                esac

            fi

        fi

        overwrite=${overwrite:-$overwrite_all}
        backup=${backup:-$backup_all}
        skip=${skip:-$skip_all}

        if [ "$overwrite" == "true" ]
        then
            rm -rf "$dst"
            echo_success "removed $dst"
        fi

        if [ "$backup" == "true" ]
        then
            mv "$dst" "${dst}.backup"
            echo_success "moved $dst to ${dst}.backup"
        fi

        if [ "$skip" == "true" ]
        then
            echo_success "skipped $src"
        fi
    fi

    if [ "$skip" != "true" ]  # "false" or empty
    then
        ln -s "$1" "$2"
        echo_success "linked $1 to $2"
    fi
}

install_linkf () {
    local install_file=$HOME/.dotfiles/install.sh
    sed -i "`wc -l < $install_file`i\\linkf $1 $2\\" $install_file
}

install_arch_linkf () {
    local install_file=$HOME/.dotfiles/arch/install.sh
    sed -i "`wc -l < $install_file`i\\linkf $1 $2\\" $install_file
}
