#!/bin/bash

# Filsystem
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls -lh'
alias la='ls -lah'

# Grep colourisation
alias grep='grep --color'

# Helper to open stuff in Chrome
alias open-chrome='open -a "Google Chrome"'

# Date related aliases
alias week='date +%V'

# Handy helper to get a GUID
alias guid='uuidgen | tr "[:upper:]" "[:lower:]"'

# Go related shortcuts
alias gbms='cd $GOPATH/src/github.com/benmatselby'

# IP addresses
alias publicip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\\  -f2"

# Vagrant
alias vssh='vagrant ssh'
alias vprune='vagrant box prune'

# Git
alias git-top='git rev-parse --show-toplevel'
alias gfo='git f origin'

# Docker
alias drai='docker rmi $(docker images -q)'
alias drac='docker rm $(docker ps -aq)'
alias dsac='docker stop $(docker ps -aq)'
