#!/usr/bin/env zsh
export DOTFILES_PATH="$(xdg-user-dir DOTFILES)"
export DOTLY_PATH="$DOTFILES_PATH/modules/dotly"
export ZIM_HOME="$DOTFILES_PATH/shell/zsh/.zim"
export ZSH_CUSTOM="$DOTFILES_PATH/shell/zsh"
alias reload="clear && . ~/.zshrc"
