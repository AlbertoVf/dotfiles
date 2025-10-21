#!/usr/bin/env sh

export DOTFILES_PATH="$(xdg-user-dir DOTFILES)"
export    DOTLY_PATH="$DOTFILES_PATH/modules/dotly"

export EDITOR="cursor"
export VISUAL="$EDITOR --wait"

export     TERMINAL="kitty"
export FILE_MANAGER="thunar"
export      BROWSER="brave"
export         MAIL="thunderbird"
export        VIDEO="celluloid"
export        AUDIO="deadbeef"
