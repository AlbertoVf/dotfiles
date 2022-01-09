# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

ZSH_THEME="gozilla"
CASE_SENSITIVE="false"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  colored-man-pages
  command-not-found
  gitignore
  zsh-autosuggestions
  zsh-interactive-cd
  zsh-syntax-highlighting
  aliases
  history
)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
alias ag="acs"
alias reload="clear && . ~/.zshrc"
alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file
neofetch
eval "$(zoxide init zsh)"
