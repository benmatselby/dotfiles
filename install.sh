#!/usr/bin/env bash

set -e
set -f

printf "Configuration:\n"
IGNORE_OMZ=${IGNORE_OMZ:-false}
IGNORE_DOTFILES=${IGNORE_DOTFILES:-false}
IGNORE_BREW=${IGNORE_BREW:-false}
IGNORE_CODE=${IGNORE_CODE:-false}
IGNORE_GIT=${IGNORE_GIT:-false}
IGNORE_NODE=${IGNORE_NODE:-false}

if [[ ${REMOTE_CONTAINERS} ]] ; then
  IGNORE_OMZ=true
  IGNORE_BREW=true
  IGNORE_CODE=true
  IGNORE_GIT=true
  IGNORE_NODE=true
fi

printf " - IGNORE_OMZ      = %s\n" "${IGNORE_OMZ}"
printf " - IGNORE_DOTFILES = %s\n" "${IGNORE_DOTFILES}"
printf " - IGNORE_BREW     = %s\n" "${IGNORE_BREW}"
printf " - IGNORE_CODE     = %s\n" "${IGNORE_CODE}"
printf " - IGNORE_GIT      = %s\n" "${IGNORE_GIT}"
printf " - IGNORE_NODE     = %s\n" "${IGNORE_NODE}"


###
# Install oh my zsh
###
if ! ${IGNORE_OMZ} ; then
printf "\n🚀 Installing oh-my-zsh\n"
if [ -d "${HOME}/.oh-my-zsh" ]; then
  printf "oh-my-zsh is already installed\n"
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
fi


###
# Installing dotfiles
###
if ! ${IGNORE_DOTFILES} ; then
printf "\n🚀 Installing dotfiles\n"
ln -sf "$(pwd)/zsh/.zshrc" "${HOME}/.zshrc"
ln -sf "$(pwd)/zsh/benmatselby.zsh-theme" "${HOME}/.oh-my-zsh/custom/themes/"
ln -sf "$(pwd)/common/aliases" "${HOME}/.oh-my-zsh/custom/aliases.zsh"
ln -sf "$(pwd)/common/docker" "${HOME}/.oh-my-zsh/custom/docker.zsh"
ln -sf "$(pwd)/common/exports" "${HOME}/.oh-my-zsh/custom/exports.zsh"
ln -sf "$(pwd)/common/functions" "${HOME}/.oh-my-zsh/custom/functions.zsh"
ln -sf "$(pwd)/common/gh-config.yml" "${HOME}/.config/gh/config.yml"
ln -sf "$(pwd)/common/.vimrc" "${HOME}/.vimrc"
ln -sf "$(pwd)/common/.tmux.conf" "${HOME}/.tmux.conf"
ln -sf "$(pwd)/git/.gitconfig" "${HOME}/.gitconfig"
ln -sf "$(pwd)/git/.gitignore" "${HOME}/.gitignore"
fi


###
# Install brew to start with
###
if ! ${IGNORE_BREW} ; then
printf "\n🚀 Installing brew\n"
ABREW="/opt/homebrew/bin/brew"
IBREW="arch -x86_64 /usr/local/Homebrew/bin/brew"
if [ "$(arch)" = "arm64" ]; then
  printf "\nChecking the arm64 installation\n"
  if [ -d "/opt/homebrew" ] ; then
    ${ABREW} update
    ${ABREW} upgrade
  else
    sudo mkdir -p /opt/homebrew
    sudo chown -R "$(whoami)":wheel /opt/homebrew
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C /opt/homebrew
  fi

  printf "\nChecking the intel installation\n"
  if ! arch -x86_64 brew --version; then
    arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    ${IBREW} update
    ${IBREW} upgrade
  fi
else
  if ! brew --version ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    # Running on an intel machine, so ABREW and IBREW should be the same
    ABREW="${IBREW}"
    ${IBREW} update
    ${IBREW} upgrade
  fi
fi

###
# Install brew packages
###
printf "\n🚀 Installing brew packages\n"
printf "See https://github.com/Homebrew/brew/issues/7857 for the apple silicon support\n"
# Arm
ABREW_PACKAGES=(
  # amazon-ecs-cli
  awscli
  # aws/tap/copilot-cli
  bash
  # curl
  fzf
  gh
  git
  go
  glow
  htop
  hugo
  # httpie
  jq
  # k9s
  # kind
  # kubectl
  # kubectx
  # kube-ps1
  # nmap
  node
  # reattach-to-user-namespace
  # shellcheck
  # terraform
  # terragrunt
  # tflint
  # tmux
  # tmuxinator
  # wget
)
for pkg in "${ABREW_PACKAGES[@]}"; do printf "installing %s\n" "${pkg}" && ${ABREW} install "${pkg}"; done

# Intel
IBREW_PACKAGES=(
)
for pkg in "${IBREW_PACKAGES[@]}"; do printf "installing %s\n" "${pkg}" && ${IBREW} install "${pkg}"; done

printf "\nArchitectures for the brew installed applications:\n"
ALL_PACKAGES=("${IBREW_PACKAGES[@]}" "${ABREW_PACKAGES[@]}")
for pkg in "${ALL_PACKAGES[@]}"; do printf "%s - " "${pkg}" && lipo -archs "$(which "${pkg}")" || true; done

# Some tidying up
${ABREW} autoremove
${IBREW} autoremove
${ABREW} cleanup
${IBREW} cleanup
fi


###
# Configure Code
###
if ! ${IGNORE_CODE} ; then
printf "\n🚀 Installing code configuration\n"
ln -sf "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" /usr/local/bin/code
ln -sf "$(pwd)/vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
ln -sf "$(pwd)/vscode/keybindings.json" "${HOME}/Library/Application Support/Code/User/keybindings.json"

CODE_EXTENSIONS=(
  coenraads.bracket-pair-colorizer-2
  DavidAnson.vscode-markdownlint
  dbaeumer.vscode-eslint
  esbenp.prettier-vscode
  # felixfbecker.php-intellisense
  golang.go
  hashicorp.terraform
  johnpapa.vscode-peacock
  # ms-azuretools.vscode-docker
  # ms-python.python
  # msjsdiag.debugger-for-chrome
  sdras.night-owl
  streetsidesoftware.code-spell-checker
  timonwong.shellcheck
  Tyriar.sort-lines
)
for ext in "${CODE_EXTENSIONS[@]}"; do printf "installing %s\n" "${ext}" && code --install-extension "${ext}" --force; done
fi


###
# Installing git configuration
###
if ! ${IGNORE_GIT} ; then
printf "\n🚀 Installing git configuration\n"
if [ ! -f "${HOME}/.gitconfig.local" ] ; then
  cp git/.gitconfig.local "${HOME}/.gitconfig.local"

  echo "Enter your full name";
  read -re var
  sed -i '' "s/GITNAME/${var}/" "${HOME}/.gitconfig.local"

  echo "Enter your email address";
  read -re var
  sed -i '' "s/GITEMAIL/${var}/" "${HOME}/.gitconfig.local"
fi
fi


###
# Install/Update global node packages
###
if ! ${IGNORE_NODE} ; then
printf "\n🚀 Install node packages\n"
NODE_PACKAGES=(
  aws-cdk
  http-server
  less
)
for pkg in "${NODE_PACKAGES[@]}"; do printf "installing %s\n" "${pkg}" && npm install -g "${pkg}"; done
fi
