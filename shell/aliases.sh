#!/bin/sh
alias grep="grep --color"
alias cf="xclip -sel clip" # copy file content to clipboard

#* modern commands
alias cat="bat"
alias man="batman"
alias neofetch="fastfetch"

#* Folders alias
alias l="exa -lh -s type --octal-permissions --time-style long-iso"                 # List files: view octal|permissions|size|usee|long format date|Name, sorted by type
alias la="l -a"                                                                     # include hidden files
alias ls="exa --icons -s type"                                                      # Show files and dirs: sorted by type with icons
alias lsa="ls -a"                                                                   # include hidden
alias lt="exa -T --icons --octal-permissions"                                       # tree listing
alias lta="lt -a"                                                                   # include hidden
alias ltg="lta -lh -I=.git --no-user --no-permissions --git-ignore --git --no-time" # view git structure: |octal|size|git status| name
alias md="mkdir -p"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

#* packages alias
alias pacin="aura -S"                         # install package
alias pacrem="aura -Rns"                       # remove package and dependencies
alias pacsyu="aura -Syyu"                     # update all pkgs and database
alias unlock="sudo rm /var/lib/pacman/db.lck" # remove pacman lock
alias paru="paru --limit 20"                  # shearch packages by name and limited to 20 results

#* get fastest mirrors
alias mirror="sudo reflector --verbose -f 20 -l 15 -n 10 --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector -l 15 -n 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector -l 15 -n 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector -l 15 -n 10 --sort age --save /etc/pacman.d/mirrorlist"

#* git alias
alias g="/usr/bin/git"

#* kitty + kitten
alias kitten="kitty +kitten"
alias icat="kitten icat"
alias icon="kitten unicode_input"
alias themesK="kitten themes"

#* python
alias pip_freeze="pip freeze > requirements.txt"
alias activate="source .venv/bin/activate || python -m venv .venv && source .venv/bin/activate"

#* node
alias npm="pnpm"

#* php
alias laravel="composer create-project laravel/laravel"
alias artisan="php artisan"

#* docker
alias docker_build="docker-compose up -d"
alias docker_run="docker-compose up"
