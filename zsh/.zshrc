[ ! -d ~/.config/zsh/zsh-autosuggestions ] &&
 git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
[ ! -d ~/.config/zsh/powerlevel10k ] && 
  git clone https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/powerlevel10k
[ ! -d ~/.config/zsh/zsh-syntax-highlighting ] && 
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting
[ ! -d ~/.config/zsh/zsh-vi-mode ] &&
  git clone https://github.com/jeffreytse/zsh-vi-mode.git ~/.config/zsh/zsh-vi-mode

HISTZIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

eval "$(zoxide init zsh --cmd j)"
eval "$(fzf --zsh)"

source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/.p10k.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh

export PATH="${PATH}:$HOME/bin"

alias ls='lsd --group-dirs first'
alias cat='bat -p --paging=never'
alias v='nvim'
alias lg='lazygit'
