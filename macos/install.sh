#!/usr/bin/env sh

set -e

echo "🚀 macos installation"

# Cleanup the desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# Make the changes permanent
killall Finder
