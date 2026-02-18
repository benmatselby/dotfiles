# AWS
alias aws-loggs='aws logs describe-log-groups --query "logGroups[*].logGroupName" --output table'
alias aws-dellgg='aws logs delete-log-group --log-group-name'

# Brew
alias brew-uninstall-packages='brew remove --force $(brew list --formula) && brew remove --cask --force $(brew list)'

# Docker
alias gh-docker-login='echo ${GITHUB_TOKEN} | docker login ghcr.io -u ${GITHUB_USER} --password-stdin'

# Filesystem
alias ghbms='cd ${HOME}/git/github/benmatselby/'
alias ghw='cd ${HOME}/git/github/${GITHUB_ORG}/'
alias gic='cd ${HOME}/Library/Mobile\ Documents/com~apple~CloudDocs/'

# gcloud
alias gcloud-proj-list='gcloud config configurations list'
alias gcloud-proj-use='gcloud config configurations activate'
alias gcloud-auth-login='gcloud auth login && gcloud auth application-default login'

# Docker
alias drasi='docker rmi $(docker images -f "dangling=true" -q)'
alias drai='docker rmi $(docker images -q)'
alias drac='docker rm $(docker ps -aq)'
alias dsac='docker stop $(docker ps -aq)'

# Git
alias ga='git add -v'
alias gb='git branch'
alias gba='git branch --all'
alias gbD='git branch --delete --force'
alias gbd='git branch --delete'
alias gbvv='git branch -vv'
alias gbvv='git branch -vv'
alias gc='git commit --verbose'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcs='git commit --gpg-sign -v'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdn='git diff --name-only'
alias gdn='git diff --name-only'
alias gf='git fetch'
alias gfa='git fetch --all --tags --prune --jobs=10'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'
alias glg='git log --stat'
alias glgg='git log --graph'
alias glgp='git log --stat --patch'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grh='git reset'
alias grhh='git reset --hard'
alias gsh='git show'
alias gst='git status'

# Go
alias godeps='go list -u -f "{{if (and (not (or .Main .Indirect)) .Update)}}{{.Path}}: {{.Version}} -> {{.Update.Version}}{{end}}" -m all 2> /dev/null'

# Kubernetes
alias k='kubectl'

# Minikube
alias mkmount='minikube mount "$(pwd)":"$(pwd)"'
alias mkssh='ssh -i ~/.minikube/machines/minikube/id_rsa docker@$(minikube ip)'

# Multipass
alias mp='multipass'
alias mp-docker-start='multipass launch -c 2 -m 2G -d 40G -n docker-multipass 20.04 --cloud-init ${HOME}/git/github/${GITHUB_USER}/dotfiles/common/multipass-docker.yml'

# Note taking
alias life='cd $HOME/git/github/benmatselby/life'
alias eod-life='cd $HOME/git/github/benmatselby/life && git add . && git commit -anm "`date`" && git push origin main'

# OS
alias -- -='cd -'
alias ..='cd ../'
alias ...=../..
alias ....=../../..
alias .....=../../../..
alias ......=../../../../..
alias _='sudo '
alias envg='env | grep -i'
alias envs='env | sort'
alias guid='uuidgen | tr "[:upper:]" "[:lower:]"'
alias localip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\\  -f2"
alias ls='ls -lGh'
alias open-chrome='open -a "Google Chrome"'
alias open-ports="lsof -i -P -n | grep LISTEN"
alias path-list='echo $PATH | tr ":" "\n"'
alias publicip="dig +short myip.opendns.com @resolver1.opendns.com"
alias week='date +%V'
alias musicn="music next && music status"
alias musicp="music previous && music status"

# Tmux
alias ta="tmux attach"

# Vim
alias vim='nvim'
