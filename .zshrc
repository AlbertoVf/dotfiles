ZSH_THEME="gozilla"
CASE_SENSITIVE="false"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
    aliases
    command-not-found
    gitignore
    sudo
    safe-paste
    themes
    zoxide
    zsh-interactive-cd
)

source $HOME/.oh-my-zsh/oh-my-zsh.sh
source $HOME/.shell/scripts/alias_shell.sh
source $HOME/.shell/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $HOME/.shell/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $HOME/.shell/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
eval "$(zoxide init zsh)"
eval "$(mcfly init zsh)"

alias ag="acs"
alias reload="clear && . ~/.zshrc"
alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file
alias h="mcfly search"

bindkey -r "^s" # remove the default binding for Ctrl+s (remove bck-i-search) to use mcfly
