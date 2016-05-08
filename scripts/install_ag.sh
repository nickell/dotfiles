#!/bin/bash

install_ag () {
    # Test to see if ag is installed.
    if hash ag 2>/dev/null; then
        echo "Ag already installed."
    else
		platform=$(uname);
		# If the platform is Linux, try an apt-get to install ag
		if [[ $platform == 'Linux' ]]; then
			if [[ -f /etc/redhat-release ]]; then
				sudo yum install the_silver_searcher
			fi
			if [[ -f /etc/debian_version ]]; then
				sudo apt-get install silversearcher-ag
			fi
			# If the platform is OS X, tell brew to install ag
		elif [[ $platform == 'Darwin' ]]; then
			brew install the_silver_searcher
			exit
		fi
    fi
}
