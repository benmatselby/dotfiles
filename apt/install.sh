#!/usr/bin/env sh

if [[ "$(uname -s)" != "Linux" ]]; then
  exit 0
fi

###
# Update apt
###
# printf "\n🚀 Updating apt\n"
sudo apt-get update
sudo apt-get upgrade -y


###
# Install apt packages
###
printf "\n🚀 Installing apt packages\n"

APT_PACKAGES=(
)

for pkg in "${BASE_PACKAGES[@]}"; do printf "installing %s\n" "${pkg}" && sudo apt-get install "${pkg}"; done
