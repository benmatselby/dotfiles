# AI
alias d-ollama-start="docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama"
alias d-ollama-run="docker exec -it ollama ollama run llama3"
alias d-ollama="docker exec -it ollama ollama"

# AWS
alias aws-loggs='aws logs describe-log-groups --query "logGroups[*].logGroupName" --output table'
alias aws-dellgg='aws logs delete-log-group --log-group-name'

# benmatselby apps
alias trello='~/git/github/benmatselby/trello-cli/bin/trello.php'
alias ringli='~/git/github/benmatselby/ringli/bin/ringli'

# Brew
alias brew-uninstall-packages='brew remove --force $(brew list --formula) && brew remove --cask --force $(brew list)'

# Filesystem
alias ghbms='cd ${HOME}/git/github/benmatselby/'
alias ghw='cd ${HOME}/git/github/${GITHUB_ORG}/'
alias ghjoe='cd ${HOME}/git/github/joelrap/'
alias ghjos='cd ${HOME}/git/github/minejosh/'
alias gic='cd ${HOME}/Library/Mobile\ Documents/com~apple~CloudDocs/'

# gcloud
alias gcloud-proj-list='gcloud config configurations list'
alias gcloud-proj-use='gcloud config configurations activate'

# Git
## Rely mainly on omz git plugin
alias gdn='git diff --name-only'
alias gdns='git diff --name-status'
alias gcs='git commit --gpg-sign -v' # Override omz to provide -v flag
alias gnignore='git update-index --no-assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias gbvv='git branch -vv'

# Docker
alias drasi='docker rmi $(docker images -f "dangling=true" -q)'
alias drai='docker rmi $(docker images -q)'
alias drac='docker rm $(docker ps -aq)'
alias dsac='docker stop $(docker ps -aq)'

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

# neovim
alias n=nvim

# Node
alias nvmu='nvm use'

# Note taking
alias life='cd $HOME/git/github/benmatselby/life'
alias eod-life='cd $HOME/git/github/benmatselby/life && git add . && git commit -anm "`date`" && git push origin main'

# OS
alias agi='ag -i'
alias ls='ls -lGh'
alias envs='env | sort'
alias envg='env | grep -i'
alias dm-change="osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to not dark mode'"
alias open-ports="lsof -i -P -n | grep LISTEN"

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

function wslim() {
  curl "https://wttr.in/$1?format=%cWeather+in+%l:+%C+%t,+%p+%w"
}
