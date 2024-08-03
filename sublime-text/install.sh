#!/usr/bin/env sh

set -e

echo "🚀 Sublime Text configuration"

ln -sf "${PWD}/sublime-text/Default (OSX).sublime-keymap" "${HOME}/Library/Application Support/Sublime Text/Packages/User/Default (OSX).sublime-keymap"
ln -sf "${PWD}/sublime-text/Preferences.sublime-settings" "${HOME}/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings"
