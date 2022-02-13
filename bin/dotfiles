#!/usr/bin/env zsh

set -e

command="${1}"

# Shift the first argument off, as we are using that.
# http://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_07.html
shift

case "${command}" in
  "install")
    package="${1}"
    echo "🚀 Installing package: ${package}"
    (cd "${DOTFILES_LOCATION}/${package}" && ./install.sh)
    echo "\n"
    ;;
  *)
    echo "${command} does not exist"
  exit 1
    ;;
esac
