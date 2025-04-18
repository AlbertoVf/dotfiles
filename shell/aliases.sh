#!/usr/bin/env sh

#* copy file content to clipboard
alias cf="xclip -sel clip"
#* get fastest mirrors
alias mirror="sudo reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist"

#* permissions
alias   x="chmod +x"
alias   r="chmod +r"
alias   w="chmod +w"
alias 775="chmod 755"

#* Folders alias
# Show octal|permissions|size|user|date|name
alias   l="eza -lh --hyperlink --octal-permissions -s=type --total-size --time-style=long-iso"
alias  la="l -a"
# Show permissions|user| icon+name
alias  ls="eza -lhX --icons --hyperlink -s=type --no-time --no-filesize"
alias lsa="ls -a"
# Show tree view
alias  lt="eza -lhXT --icons --hyperlink -L2 --no-time --no-filesize --no-user"
alias lta="lt -a"

#* packages alias
alias pacin="aura -S"                         # install package

alias pacsyu="aura -Syyu"    # update all pkgs and database
alias pacrem="aura -Rns"     # remove package and dependencies

alias unlock="sudo rm /var/lib/pacman/db.lck" # remove pacman lock
# alias   paru="paru --limit 20"                # shearch packages by name and limited to 20 results

#* python
alias activate="source .venv/bin/activate"
alias     venv="python -m venv .venv"

#* php
alias laravel="composer create-project laravel/laravel"
alias artisan="php artisan"

#* docker
alias docker_build="docker-compose up -d"
alias   docker_run="docker-compose up"

#* git alias
alias g="/usr/bin/git"

#* kitty + kitten
alias  kitten="kitty +kitten"
alias    icon="kitten unicode_input"
alias themesK="kitten themes"
