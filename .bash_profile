# Export Information
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTCONTROL=ignoreboth
export EDITOR=vim
export PATH="$PATH:$HOME/.composer/vendor/bin/"
export GREP_COLOR="1;35"

# Setup the prompts
export PS1='\[\e[035;40m\]\h \D{%F %T}: \[\033[33m\]\w\[\033[00m\] $(__git_ps1 "(%s)")\n\$ '
export MYSQL_PS1='\u@\h \R:\m:\s mysql> '

# PHP versioning
if [ "`uname`" == "Darwin" ]; then
    PHP_VERSION=php72
    export PATH="$(brew --prefix $PHP_VERSION)/bin:$PATH"
    alias php="php -dzend_extension=$(brew --prefix $PHP_VERSION-xdebug)/xdebug.so"
    alias phpunit="phpunit --verbose"
    alias phpunit-c="php $(which phpunit) --coverage-html=build/coverage/ --verbose"
fi

# Bash scripts to load
if [ -f /usr/local/etc/bash_completion ]; then
    source /usr/local/etc/bash_completion
fi

# Alias information
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
if [ -f ~/.bash_work_aliases ]; then
    source ~/.bash_work_aliases
fi

# Functions
if [ -f ~/.bash_functions ]; then
    source ~/.bash_functions
fi
