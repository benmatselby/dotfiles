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
alias gic='cd ${HOME}/Library/Mobile\ Documents/com~apple~CloudDocs/'

# gcloud
alias gcloud-proj-list='gcloud config configurations list'
alias gcloud-proj-use='gcloud config configurations activate'

# Git
## Rely mainly on omz git plugin
alias ga='git add'
alias gb='git branch'
alias gba='git branch --all'
alias gbD='git branch --delete --force'
alias gbd='git branch --delete'
alias gbvv='git branch -vv'
alias gbvv='git branch -vv'
alias gc='git commit --verbose'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcs='git commit --gpg-sign -v' # Override omz to provide -v flag
alias gd='git diff'
alias gdca='git diff --cached'
alias gdn='git diff --name-only'
alias gdn='git diff --name-only'
alias gdns='git diff --name-status'
alias gdns='git diff --name-status'
alias gds='git diff --staged'
alias gf='git fetch'
alias gfa='git fetch --all --tags --prune --jobs=10'
alias gfg='git ls-files | grep'
alias gfo='git fetch origin'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias gnignore='git update-index --no-assume-unchanged'
alias glg='git log --stat'
alias glgg='git log --graph'
alias glgp='git log --stat --patch'
alias glola='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias glols='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
alias gnignore='git update-index --no-assume-unchanged'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase $(git_develop_branch)'
alias grbi='git rebase --interactive'
alias grbm='git rebase $(git_main_branch)'
alias grbo='git rebase --onto'
alias grh='git reset'
alias grhh='git reset --hard'
alias grhk='git reset --keep'
alias grhs='git reset --soft'
alias grmc='git rm --cached'
alias gsh='git show'

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

# Node
alias nvmu='nvm use'

# Note taking
alias life='cd $HOME/git/github/benmatselby/life'
alias eod-life='cd $HOME/git/github/benmatselby/life && git add . && git commit -anm "`date`" && git push origin main'

# OS
alias ag-notests='ag --hidden --ignore="*_tests.py"'
alias ag='ag --hidden'
alias agi='ag -i'
alias aliasg='alias | grep '
alias dm-change="osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to not dark mode'"
alias envg='env | grep -i'
alias envs='env | sort'
alias guid='uuidgen | tr "[:upper:]" "[:lower:]"'
alias localip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\\  -f2"
alias ls='ls -lGh'
alias open-chrome='open -a "Google Chrome"'
alias open-ports="lsof -i -P -n | grep LISTEN"
alias path-list='echo $PATH | tr ":" "\n"'
alias publicip="dig +short myip.opendns.com @resolver1.opendns.com"
alias timer="shortcuts run Timer"
alias week='date +%V'

# Python


# Terraform
alias tf='terraform'
alias tg='terragrunt'

# tmux - Pulled from omz plugin
alias ta="tmux attach"
alias tkss="tmux kill-session -t"
alias tksv='tmux kill-server'
alias tl='tmux list-sessions'
alias tmuxconf='$EDITOR $ZSH_TMUX_CONFIG'
alias ts="tmux new-session -s"

# Weather
function weather() {
  curl "https://wttr.in/$1"
}

function wslim() {
  curl "https://wttr.in/$1?format=%cWeather+in+%l:+%C+%t,+%p+%w"
}
