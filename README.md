# Dotfiles

GNU `stow` to create symlink for everything or just some folder
```
stow */ # Everything (the '/' ignores the README)
```

```
stow zsh
```

### Brew
Install homebrew packages listed in Brewfile
```
brew bundle
```

Dump installed brew packages
```
brew bundle dump -f --describe
```