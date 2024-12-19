#!/usr/bin/env sh

set -e

echo "🚀 git configuration"

# Check if the file exists
if [ ! -f "${HOME}/.gitconfig" ]; then
  cp "${PWD}/git/.gitconfig.local" "${HOME}/.gitconfig.local"

  echo "Enter your full name";
  read -r var
  sed -i '' "s|GITNAME|${var}|" "${HOME}/.gitconfig.local"

  echo "Enter your email address";
  read -r var
  sed -i '' "s|GITEMAIL|${var}|" "${HOME}/.gitconfig.local"

  echo "Entire the path to your public ssh key"
  read -r var
  sed -i '' "s|GITSIGNKEY|${var}|" "${HOME}/.gitconfig.local"
fi

ln -sf "${PWD}/git/.gitconfig" "${HOME}/.gitconfig"
ln -sf "${PWD}/git/.gitignore" "${HOME}/.gitignore"
