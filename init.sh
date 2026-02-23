#!/usr/bin/env bash

set -e

mkdir -p ~/.config/zsh
mkdir -p ~/Library/Application\ Support/code/User

stow -t ~ zsh
stow -t ~ bin
stow -t ~ vscode