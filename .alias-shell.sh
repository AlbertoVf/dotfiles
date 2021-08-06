#!/bin/bash
export EDITOR="nvim"

alias grep='grep --color'
alias h='history'
alias ag="alias | grep"
alias s="sudo"
alias example="tldr"

# Show files and dirs: sorted by type, icons, readable
alias ls='exa --icons -tR -s type'
# long format, sorted by type, view octal permissions
alias l='exa -lh -s type --octal-permissions --time-style long-iso'
alias la='exa --icons -a -s type' # all files and dirs, sorted by type
 # all files and dir long format, sorted by type, view octal permissions
alias lsa='exa -alh -s type --octal-permissions --time-style long-iso'
alias lt='exa -aT --icons' # tree listing
alias ll="exa -1@ | grep '\->' | awk -F '->' '{ print $1 }'"
alias lg="exa -laGRTh -I .git --no-user --no-time --no-filesize --no-permissions -rs modified --octal-permissions --git-ignore --git"
# files and folders
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -pv'
# Git alias
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gd='git diff'
alias gl='git log --graph'
alias glg='git log --stat'
alias gc='git commit -m'
alias gp='git push'
alias gpm='git push --mirror'
alias gpl='git pull'
alias grst='git restore'
alias grsta='git restore :/'
alias gr='git remote'
alias gst='git status'
alias gt='git tag -a'
# Pacman & Paru alias
alias pacin='sudo pacman -S'
alias pacins='sudo pacman -U'
alias paclsorphans='sudo pacman -Qdt'
alias pacre='sudo pacman -R'
alias pacrem='sudo pacman -Rns'
alias pacupg='sudo pacman -Syu'
alias pacsyu='sudo pacman -Syyu'                 # update only standard pkgs
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # cleanup orphaned packages
alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock

# Dotfiles alias
alias dotfiles='/usr/bin/git --git-dir=$(xdg-user-dir DOTFILES) --work-tree=$HOME'
alias dota='dotfiles add'
alias dotl='dotfiles log --stat'
alias dotc='dotfiles commit -m'
alias dotp='dotfiles push'
alias dotst='dotfiles status'

# Shell alias
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"


function extract {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
  else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
        case "${n%,}" in
          *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) tar xvf "$n";;
          *.lzma) unlzma ./"$n";;
          *.bz2) bunzip2 ./"$n";;
          *.cbr|*.rar) unrar x -ad ./"$n";;
          *.gz) gunzip ./"$n";;
          *.cbz|*.epub|*.zip) unzip ./"$n";;
          *.z) uncompress ./"$n";;
          *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
          z x ./"$n";;
          *.xz) unxz ./"$n";;
          *.exe) cabextract ./"$n";;
          *.cpio) cpio -id < ./"$n";;
          *.cba|*.ace) unace x ./"$n";;
          *)
            echo "extract: '$n' - unknown archive method"
            return 1
          ;;
        esac
      else
        echo "'$n' - file does not exist"
        return 1
      fi
    done
  fi
}

function run {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: run <path/file_name>.<sh|zsh|bash>
                            <py|ts|js|java>
                            <mp4|mp3|m4a|aac|flac>
                            <jpg|jpeg|png|bmp|gif>
    <pdf>"
  else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
        case "${n%,}" in
          *.sh) sh ./"$n";;
          *.zsh) zsh ./"$n";;
          *.bash) bash ./"$n";;
          *.py) python ./"$n";;
          *.java) java ./"$n";;
          *.ts|*.js) deno run ./"$n";;
          *.mp4|*.mp3|*.m4a|*.aac|*.flac) vlc ./"$n";;
          *.pdf) evince ./"$n";;
          *.jpg|*.jpeg|*.png|*.bmp|*.gif) feh ./"$n";;
          *) $EDITOR ./"$n"
        esac
      else
        echo "'$n' - file does not exist"
        return 1
      fi
    done
  fi
}

# Youtube-dl alias
ruta="$(xdg-user-dir DOWNLOAD)/"
metadata="--embed-thumbnail --add-metadata"
extract="--extract-audio --audio-quality 0 --audio-format"
file="-o $ruta'%(title)s.%(ext)s' --no-playlist"
list="-o $ruta'%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'"
list2="-o $ruta'%(playlist)s/%(title)s.%(ext)s'"

# youtube audio
alias yt-mp3="youtube-dl $metadata $extract mp3 $file"
alias yt-m4a="youtube-dl $metadata $extract m4a $file"
alias yt-aac="youtube-dl $metadata $extract aac $file"
alias yt-flac="youtube-dl $metadata $extract flac $file"

# youtube video
alias yt-mp4="youtube-dl --add-metadata -f mp4 $file"

# youtube playlist order
alias yt-audio-list="youtube-dl -w $metadata $extract mp3 $list"
alias yt-video-list="youtube-dl -w --add-metadata -f mp4 $list"

# youtube playlist unorder
alias yt-audio-unlist="youtube-dl -w $metadata $extract mp3 $list2"
alias yt-video-unlist="youtube-dl -w --add-metadata -f mp4 $list2"

# youtube user videos
alias yt-user-audio="youtube-dl -w  $metadata $extract mp3 -o $ruta'%(uploader)s/%(title)s.%(ext)s'"
alias yt-user-video="youtube-dl -w --add-metadata -f mp4 -o $ruta'%(uploader)s/%(title)s.%(ext)s'"

alias yt-conf=$EDITOR "~/.config/youtube-dl/config" # editor
