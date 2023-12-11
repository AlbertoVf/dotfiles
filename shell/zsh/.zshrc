#!/usr/bin/env zsh
# Uncomment for debuf with `zprof`
# zmodload zsh/zprof
# Start Zim
source "$ZIM_HOME/init.zsh"

# ZSH Ops
setopt HIST_IGNORE_ALL_DUPS
# setopt HIST_FCNTL_LOCK
# setopt +o nomatch
# setopt autopushd

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)


# Async mode for autocompletion
# ZSH_AUTOSUGGEST_USE_ASYNC=true
# ZSH_HIGHLIGHT_MAXLENGTH=300


# fpath=("$DOTFILES_PATH/shell/zsh/themes" "$DOTFILES_PATH/shell/zsh/completions" "$DOTLY_PATH/shell/zsh/themes" "$DOTLY_PATH/shell/zsh/completions" $fpath)

# autoload -Uz promptinit && promptinit
# prompt ${DOTLY_THEME:-codely}

ZSH_THEME="gozilla"
CASE_SENSITIVE="false"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

alias ag="als"
alias reload="clear && . ~/.zshrc"

source $DOTLY_PATH/shell/zsh/bindings/dot.zsh
source $DOTLY_PATH/shell/zsh/bindings/reverse_search.zsh
source $DOTFILES_PATH/shell/zsh/key-bindings.zsh
source $DOTFILES_PATH/shell/zsh/.zim/modules/ohmyzsh/oh-my-zsh.sh
source $DOTFILES_PATH/shell/init.sh
