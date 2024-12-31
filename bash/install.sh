#!/usr/bin/env bash

set -e

echo "🚀 bash alias configuration"

ln -sf "${PWD}/bash/bash_aliases" "${HOME}/.bash_aliases"
ln -sf "${PWD}/bash/bash_prompt" "${HOME}/.bash_prompt"
