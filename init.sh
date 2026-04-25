#!/usr/bin/env bash

set -e

mkdir -p ~/.config/zsh
mkdir -p ~/Library/Application\ Support/code/User
mkdir -p ~/Library/LaunchAgents

stow -t ~ zsh
stow -t ~ bin
stow -t ~ vscode
stow -t ~ hammerspoon
stow -t ~ launchagents

launchctl load ~/Library/LaunchAgents/com.user.nomouseaccel.plist 2>/dev/null || true

# Dock: show instantly with no animation
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
killall Dock

mkdir -p ~/Library/Fonts
cp fonts/*.ttf ~/Library/Fonts/

echo "Done!"