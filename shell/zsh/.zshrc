#!/usr/bin/env zsh

# ZSH Ops
source "$ZIM_HOME/init.zsh"
setopt HIST_IGNORE_ALL_DUPS
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
CASE_SENSITIVE="false"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

fpath=("$DOTFILES_PATH/shell/zsh/themes" "$DOTFILES_PATH/shell/zsh/completions" "$DOTLY_PATH/shell/zsh/themes" "$DOTLY_PATH/shell/zsh/completions" $fpath)

# source $ZSH_CUSTOM/.p10k.zsh
ZSH_THEME="elessar"

source $ZSH_CUSTOM/plugins/tldr.plugin.zsh
source $DOTLY_PATH/shell/zsh/bindings/dot.zsh
source $DOTLY_PATH/shell/zsh/bindings/reverse_search.zsh
source $DOTFILES_PATH/shell/zsh/key-bindings.zsh
source $DOTFILES_PATH/shell/zsh/.zim/modules/ohmyzsh/oh-my-zsh.sh
source $DOTFILES_PATH/shell/init.sh
