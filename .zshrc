
# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

ZSH_THEME="spaceship" # mikeh, nano
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  colored-man-pages
  command-not-found
  themes
  gitignore
  zsh-autosuggestions
  zsh-interactive-cd
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $HOME/.alias-shell.sh

alias reload="clear && . ~/.zshrc"
alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file
