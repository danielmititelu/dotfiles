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

mkdir -p ~/Library/Fonts
cp fonts/*.ttf ~/Library/Fonts/

echo "Done!"