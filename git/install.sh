#!/usr/bin/env zsh

set -e

if [ ! -f "${HOME}/.gitconfig.local" ] ; then
  cp "${DOTFILES_LOCATION}/git/.gitconfig.local" "${HOME}/.gitconfig.local"

  echo "Enter your full name";
  read -r var
  sed -i '.orig' "s|GITNAME|${var}|" "${HOME}/.gitconfig.local"

  echo "Enter your email address";
  read -r var
  sed -i '' "s|GITEMAIL|${var}|" "${HOME}/.gitconfig.local"

  echo "Entire the path to your public ssh key"
  read -r var
  sed -i '' "s|GITSIGNKEY|${var}|" "${HOME}/.gitconfig.local"
fi

ln -sf "${DOTFILES_LOCATION}/git/.gitconfig" "${HOME}/.gitconfig"
ln -sf "${DOTFILES_LOCATION}/git/.gitignore" "${HOME}/.gitignore"
