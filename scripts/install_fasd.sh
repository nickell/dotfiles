#!/bin/bash

install_fasd () {
    # Test to see if ag is installed.
    if hash fasd 2>/dev/null; then
        echo "fasd already installed."
    else
        platform=$(uname);
        # If the platform is Linux, try an apt-get to install ag
        if [[ $platform == 'Linux' ]]; then
            if [[ -f /etc/redhat-release ]]; then
                sudo yum install the_silver_searcher
            fi
            if [[ -f /etc/debian_version ]]; then
                sudo add-apt-repository ppa:aacebedo/fasd
                sudo apt update
                sudo apt-get install fasd
            fi
            # If the platform is OS X, tell brew to install ag
        elif [[ $platform == 'Darwin' ]]; then
            brew install fasd
            exit
        fi
    fi
}
