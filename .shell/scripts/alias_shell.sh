#!/bin/sh
alias grep="grep --color"
alias cf="xclip -sel clip" # copy file content to clipboard

# modern commands {
alias du="ncdu2"
alias cat="bat"
alias find="fd"
alias cd="z"
alias man="batman"
# }

# Folders alias{
alias l="exa -lh -s type --octal-permissions --time-style long-iso"   # long format, sorted by type, view octal permissions
alias ls="exa --icons -tR -s type"                                    # Show files and dirs: sorted by type, icons, readable
alias la="exa -alh -s type --octal-permissions --time-style long-iso" # long format, sorted by type, view octal permissions
alias lsa="exa --icons -a -s type"                                    # all files and dirs, sorted by type
alias lt="exa -aT --icons"                                            # tree listing
alias lg="exa -lhaTI .git --icons --no-user --no-permissions --octal-permissions --git-ignore --git --no-time"
alias md="mkdir -p"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
# }

# packages alias {
alias pacin="sudo pacman -S"                  # install package
alias pacrem="sudo pacman -Rns"               # remove package and dependencies
alias pacsyu="sudo pacman -Syyu"              # update only standard pkgs
alias unlock="sudo rm /var/lib/pacman/db.lck" # remove pacman lock
alias parsua="paru -Sua"                      # update aur packages
alias parsyu="paru -Syu"                      # update standar packages and aur
alias paru="paru --limit 20 --searchby name"  # shearch packages by name and limited to 20 results
# }

# get fastest mirrors {
alias mirror="sudo reflector --verbose -f 20 -l 15 -n 10 --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector -l 15 -n 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector -l 15 -n 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector -l 15 -n 10 --sort age --save /etc/pacman.d/mirrorlist"
# }

# git alias {
alias g="/usr/bin/git"
alias dotf="/usr/bin/git --git-dir=$(xdg-user-dir DOTFILES) --work-tree=$HOME"
# }

# Youtube-dl alias {
# yt="youtube-dl"
yt="yt-dlp"
download="$(xdg-user-dir DOWNLOAD)/"
audio_extension="mp3" # wav, mp3
video_extension="mp4" # avi, mp4
extract="-i --write-thumbnail --add-metadata --no-post-overwrites --audio-quality 0 -f bestaudio -x --audio-format"
alias yt-audio="$yt $extract $audio_extension -o $download'%(title)s.%(ext)s' --no-playlist"
alias yt-audio-list="$yt -w $extract $audio_extension -o $download'%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'"
alias yt-audio-file="yt-audio --batch-file"
# alias yt-best="$yt --add-metadata -f 'bestvideo,bestaudio' -o $download'%(title)s.%(ext)s' --no-playlist"
alias yt-video="$yt --add-metadata -f $video_extension -o $download'%(title)s.%(ext)s' --no-playlist"
alias yt-video-list="$yt -w --add-metadata -f $video_extension -o $download'%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'"
alias yt-video-file="yt-video --batch-file"
# }

# files-scripts {
scripts="$(xdg-user-dir SHELLSCRIPTS)"
source "$scripts/shell_scripts.sh"
# }

# kitty + kitten {
alias kitten="kitty +kitten"
alias icat="kitten icat"
alias icon="kitten unicode_input"
alias themes="kitten themes"
# }