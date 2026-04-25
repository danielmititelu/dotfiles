# Dotfiles

GNU `stow` to create symlink
```
./init.sh
```

### Bin scripts
A single `dot` entrypoint dispatches to the scripts in `bin/bin/commands/`.
```
dot                # list all commands
dot hello          # run a script
dot pretty 3       # forward args to the script
```

To add a new script: drop an executable in `bin/bin/commands/` with a
`# desc: ...` comment on line 2 (after the shebang) — `dot` and tab-completion
pick it up automatically.

### Brew
Install homebrew packages listed in Brewfile
```
brew bundle
```

Dump installed brew packages
```
brew bundle dump -f --describe
```

### Fonts
Meslo Nerd fonts taken from powerlevel10k [repo](https://github.com/romkatv/powerlevel10k/blob/master/font.md) 

### Mac commands
Show dock instantly
```
defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
```
