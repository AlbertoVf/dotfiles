[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

PS1='[\u@\h \W]\$ '

if [ -d "$HOME/.bin" ]; then
    PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

[[ -f ~/.shell/scripts/alias_shell.sh ]] && . ~/.shell/scripts/alias_shell.sh
