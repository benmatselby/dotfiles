#!/bin/bash
##
# Get diff command
#
function _diff-command()
{
    if [ -z "$1" ]
    then
        cmd="git dn"
    else
        cmd="git dn $1"
    fi

    echo $cmd
}

##
# Get the path to the composer tools. As it could be in a few places
# in the codebases I work with
#
function _get-composer-tool-path()
{
    tool=$1
    if [ -f ./bin/${tool} ]; then
        tool=./bin/${tool}
    fi

    if [ -f ./vendor/bin/${tool} ]; then
        tool=./vendor/bin/${tool}
    fi

    echo ${tool}
}

##
# Lint each file in the diff set
#
# Basic at the moment, doesn't perform checking etc
#
function lint-diff()
{
    cmd=`_diff-command $1`
    for i in `$cmd`
    do
        php -l $i;
    done
}

##
# phpcs the diff
#
function sniff-diff()
{
    cmd=`_get-composer-tool-path phpcs`
    files=`_diff-command`
    for i in `${files}`
    do
        echo $i;
        ${cmd} $i;
    done
}

##
# phpmd the diff
#
function mess-diff()
{
    cmd=`_get-composer-tool-path phpmd`
    files=`_diff-command`
    for i in `${files}`
    do
        ${cmd} $i text codesize,controversial,design,naming,unusedcode;
    done
}

##
# Go Faster stripes for the mac terminal
# Pretty much brute force
#
function terminal-go-faster()
{
    sudo rm -f /var/log/asl/*.asl
}

##
# Make Safari fast again
#
# It does get a little upset every now and again
#
# This seems to fix
# - Double tap for global search instead of URLs in address bar
# - Speed wores
function make-safari-great-again()
{
    sudo rm -f ~/Library/Preferences/com.apple.Safari.plist
}
