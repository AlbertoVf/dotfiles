#!/usr/bin/env sh

. "$(dirname "$0")/aliases_overwrite.sh"

# get fastest mirrors
alias mirror="sudo reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist"

# permissions
alias   x="chmod +x"
alias   r="chmod +r"
alias   w="chmod +w"
alias 775="chmod 755"
alias 644="chmod 644"

# Folders alias
# Show octal|permissions|size|user|date|name
alias   l="eza -lh --hyperlink --octal-permissions -s=type --total-size --time-style=long-iso"
alias  la="l -a"
# Show permissions|user| icon+name
alias  ls="eza -lhX --icons --hyperlink -s=type --no-time --no-filesize"
alias lsa="ls -a"
# Show tree view
alias  lt="eza -lhXT --icons --hyperlink -L2 --no-time --no-filesize --no-user"
alias lta="lt -a"

# packages alias
alias  pacin="aura -S"                        # install package
alias pacsyu="aura -Syyu"                     # update all pkgs and database
alias pacrem="aura -Rns"                      # remove package and dependencies
alias unlock="sudo rm /var/lib/pacman/db.lck" # remove pacman lock
alias parsua="paru -Sua" 					  # update AUR packages

# python
alias     activate="source .venv/bin/activate"
alias         venv="python -m venv .venv && source .venv/bin/activate"
alias requirements="pip install -r requirements.txt"

# php
alias artisan="php artisan"

# docker
alias docker_build="docker-compose up -d"
alias   docker_run="docker-compose up"

# git alias
alias g="/usr/bin/git"

#clamscan
alias  clam="sudo freshclam"
alias  scan="clamscan -r --follow-dir-symlinks=2 --follow-file-symlinks=2 --bell"
