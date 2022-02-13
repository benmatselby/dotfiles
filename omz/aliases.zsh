# Filesystem
alias ghbms='cd ${HOME}/git/github/benmatselby/'
alias ghw='cd ${HOME}/git/github/${GITHUB_ORG}/'
alias ghjoe='cd ${HOME}/git/github/joelrap/'
alias ghjos='cd ${HOME}/git/github/minejosh/'
alias gic='cd ${HOME}/Library/Mobile\ Documents/com~apple~CloudDocs/'

# Git
alias gdn='git diff --name-only'
alias gdns='git diff --name-status'

# Docker
alias drasi='docker rmi $(docker images -f "dangling=true" -q)'
alias drai='docker rmi $(docker images -q)'
alias drac='docker rm $(docker ps -aq)'
alias dsac='docker stop $(docker ps -aq)'

# Go
alias godeps='go list -u -f "{{if (and (not (or .Main .Indirect)) .Update)}}{{.Path}}: {{.Version}} -> {{.Update.Version}}{{end}}" -m all 2> /dev/null'

# Minikube
alias mkmount='minikube mount "$(pwd)":"$(pwd)"'
alias mkssh='ssh -i ~/.minikube/machines/minikube/id_rsa docker@$(minikube ip)'

# Multipass
alias mp='multipass'
alias mp-docker-start='multipass launch -c 2 -m 2G -d 40G -n docker-multipass 20.04 --cloud-init ${HOME}/git/github/${GITHUB_USER}/dotfiles/common/multipass-docker.yml'

# Node
alias nvmu='nvm use'

# Note taking
alias work='cd $HOME/git/github/benmatselby/work'
alias eod-work='cd $HOME/git/github/benmatselby/work && git add . && git commit -anm "`date`" && git push origin main'
alias eod-journal='cd ${HOME}/Library/Mobile\ Documents/com~apple~CloudDocs/Ben/journal && git add . && git commit -anm "`date`"'

# OS
alias ls='ls -lGh'
alias envs='env | sort'
alias envg='env | grep -i'
alias sed=gsed

# Random
alias aliasg='alias | grep '
alias open-chrome='open -a "Google Chrome"'
alias guid='uuidgen | tr "[:upper:]" "[:lower:]"'
alias publicip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\\  -f2"
alias week='date +%V'

# Terraform
alias tf='terraform'
alias tg='terragrunt'

# Weather
function weather() {
  curl "https://wttr.in/$1"
}
