# Ansible
export ANSIBLE_COW_SELECTION=random

# Go
export GOPATH=$HOME/go
export GOPRIVATE='github.com/benmatselby'
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# OS
export CDPATH=${CDPATH}:~/git
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTCONTROL=ignoreboth
export EDITOR=vim
export GREP_COLOR="1;35"

# Pagers
export MANPAGER="less -X";
export PAGER="less -X";
export AWS_PAGER=

# Path
if [ "$(arch)" = "arm64" ]; then
  export PATH=/opt/homebrew/bin:$PATH
else
  export PATH=/usr/local/bin:$PATH
fi

# MySQL
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export MYSQL_PS1='\u@\h \R:\m:\s mysql> '

# Startship
export STARSHIP_CONFIG="${HOME}/.config/starship-pastel.toml"

# tmux
# export ZSH_TMUX_ITERM2=true
# Loading here, otherwise omz cannot find it in the paths we have
omz plugin load tmux
