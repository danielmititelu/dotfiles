[ ! -d ~/.config/zsh/zsh-autosuggestions ] &&
 git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
[ ! -d ~/.config/zsh/powerlevel10k ] && 
  git clone https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/powerlevel10k
[ ! -d ~/.config/zsh/zsh-syntax-highlighting ] && 
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f $HOMEBREW_PREFIX/etc/profile.d/autojump.sh ] || . $HOMEBREW_PREFIX/etc/profile.d/autojump.sh

source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/.p10k.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls='lsd -hA --group-dirs first'
alias cat='bat --paging=never'
