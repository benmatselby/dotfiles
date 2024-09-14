#!/usr/bin/env sh

# Get first argument
if [ -z "$1" ]; then
  echo "Usage: $0 <theme>"
  exit 1
fi

# Set theme
THEME=$1
echo "Setting theme to ${THEME}"

# Backgrounds
osascript -e "tell application \"System Events\" to set picture of every desktop to \"${PWD}/themes/${THEME}/background.png\""

# Neovim
mkdir -p ~/.config/nvim/lua/plugins
cp "${PWD}/themes/${THEME}/neovim.lua" ~/.config/nvim/lua/plugins/theme.lua

# VSCode
source "${PWD}/themes/${THEME}/vscode.sh"
sed -i '' "s/\"workbench.colorTheme\": \".*\"/\"workbench.colorTheme\": \"${VSC_THEME_DARK}\"/g" "${PWD}/vscode/settings.json"
sed -i '' "s/\"workbench.preferredDarkColorTheme\": \".*\"/\"workbench.preferredDarkColorTheme\": \"${VSC_THEME_DARK}\"/g" "${PWD}/vscode/settings.json"
sed -i '' "s/\"workbench.preferredLightColorTheme\": \".*\"/\"workbench.preferredLightColorTheme\": \"${VSC_THEME_LIGHT}\"/g" "${PWD}/vscode/settings.json"

# Tmux
ln -sf "${PWD}/themes/${THEME}/tmux.conf" ~/.config/tmux/theme.conf
