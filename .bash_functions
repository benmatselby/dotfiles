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
# Lint each file in the diff set
#
# Basic at the moment, doesn't perform checking etc
#
function lint-diff()
{
    cmd=`_diff-command $1`
    echo $cmd
    for i in `$cmd`
    do
        php -l $i;
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
