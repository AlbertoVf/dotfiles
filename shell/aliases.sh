#!/usr/bin/env sh

alias   ag="als"
alias   cf="xclip -sel clip" # copy file content to clipboard
alias ping="ping -c 1"


#* modern commands
alias      cat="bat"
alias      man="batman"
alias neofetch="fastfetch"
alias     sudo="doas"
alias       cd="z"
alias       du="dust"
alias     find="fd"
alias     grep="rg"

#* Folders alias
alias   l="exa -lh -s type --octal-permissions --time-style long-iso --hyperlink"   # List files: view octal|permissions|size|usee|long format date|Name, sorted by type
alias  la="l -a"                                                                    # include hidden files
alias  ls="exa --icons -s type --hyperlink"                                         # Show files and dirs: sorted by type with icons
alias lsa="ls -a"                                                                   # include hidden
alias  lt="exa -T --icons --octal-permissions --hyperlink"                          # tree listing
alias lta="lt -a"                                                                   # include hidden
alias ltg="lta -lh -I=.git --no-user --no-permissions --git-ignore --git --no-time" # view git structure: |octal|size|git status| name

alias mkdir="mkdir -vp"
alias    cp="cp -vi"
alias    mv="mv -vi"
alias    rm="rm -i"


#* packages alias
alias pacin="aura -S"                         # install package

alias  pacup="aura -A"                        # update package
alias pacsyu="aura -Syyu"                     # update all pkgs and database

alias pacrem="aura -Rns"     # remove package and dependencies
alias orphan="sudo aura -Oj" # Remove orphans
alias  clean="sudo aura -Sc" # Clean out old and unused caches and packages

alias unlock="sudo rm /var/lib/pacman/db.lck" # remove pacman lock
alias   paru="paru --limit 20"                # shearch packages by name and limited to 20 results


#* get fastest mirrors
alias  mirror="sudo reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist"

#* git alias
alias g="/usr/bin/git"


#* kitty + kitten
alias  kitten="kitty +kitten"
alias    icon="kitten unicode_input"
alias themesK="kitten themes"


#* python
alias pip_freeze="pip freeze > requirements.txt"
alias   activate="source .venv/bin/activate || python -m venv .venv && source .venv/bin/activate"


#* node
alias npm="pnpm"


#* php
alias laravel="composer create-project laravel/laravel"
alias artisan="php artisan"


#* docker
alias docker_build="docker-compose up -d"
alias   docker_run="docker-compose up"


#* permissions
alias chmod="chmod -v"
alias     x="chmod +x"
alias     r="chmod +r"
alias     w="chmod +w"
alias   775="chmod 755"

alias chown="chown -c"
