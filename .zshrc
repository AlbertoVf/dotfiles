# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.shell/zsh/.p10k.zsh ]] || source ~/.shell/zsh/.p10k.zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="false"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  aliases
  colored-man-pages
  command-not-found
  gitignore
  sudo
  zsh-autosuggestions
  zsh-interactive-cd
  zsh-syntax-highlighting
)

source $HOME/.oh-my-zsh/oh-my-zsh.sh
source $HOME/.shell/scripts/alias_shell.sh

alias ag="acs"
alias reload="clear && . ~/.zshrc"
alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file
eval "$(zoxide init zsh)"
eval "$(mcfly init zsh)"
alias h="mcfly search"


# BINDING
# ^  : Control
# ^X : Esc
bindkey -r "^s" # remove the default binding for Ctrl+s (remove bck-i-search) to use mcfly
