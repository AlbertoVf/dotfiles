#!/usr/bin/env zsh

source "$ZIM_HOME/init.zsh"

# ZSH Ops
setopt HIST_IGNORE_ALL_DUPS

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

fpath=("$DOTFILES_PATH/shell/zsh/themes" "$DOTFILES_PATH/shell/zsh/completions" "$DOTLY_PATH/shell/zsh/themes" "$DOTLY_PATH/shell/zsh/completions" $fpath)

ZSH_THEME="gozilla"
CASE_SENSITIVE="false"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

alias ag="als"
alias cd="z"
alias reload="clear && . ~/.zshrc"

source $DOTLY_PATH/shell/zsh/bindings/dot.zsh
source $DOTLY_PATH/shell/zsh/bindings/reverse_search.zsh
source $DOTFILES_PATH/shell/zsh/key-bindings.zsh
source $DOTFILES_PATH/shell/zsh/.zim/modules/ohmyzsh/oh-my-zsh.sh
source $DOTFILES_PATH/shell/init.sh

