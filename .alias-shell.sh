#!/bin/bash
export EDITOR="nvim"

alias grep='grep --color'
alias h='history'
alias ag="alias | grep"
alias s="sudo"
alias example="tldr"
# ls, the common ones I use a lot shortened for rapid fire usage
alias l='exa -tRFh'   	#sorted by date,recursive,show type,human readable
alias ls='exa -l --color=always --group-directories-first'  # long format
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias lsa='exa -al --color=always --group-directories-first' # my preferred listing
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

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

# Toutube-dl alias
ruta="$(xdg-user-dir DOWNLOAD)/"
metadata="--embed-thumbnail --add-metadata"
extract="--extract-audio --audio-quality 0 --audio-format"
file="-o $ruta'%(title)s.%(ext)s' --no-playlist"
list="-o $ruta'%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'"
list2="-o $ruta'%(playlist)s/%(title)s.%(ext)s'"

# youtube audio
alias yt-mp3="youtube-dl $file $metadata $extract mp3"
alias yt-m4a="youtube-dl $file $metadata $extract m4a"
alias yt-aac="youtube-dl $file $metadata $extract aac"
alias yt-flac="youtube-dl $file $metadata $extract flac"
# youtube video
alias yt-mp4="youtube-dl $file --add-metadata -f mp4"
alias yt-all="youtube-dl -o '$ruta%(title)s/%(title)s.%(ext)s' -f 'mp4,m4a' $metadata --no-playlist" # audio + video
# youtube playlist
alias yt-video-list="youtube-dl $list --add-metadata -f mp4" # playlist video
alias yt-audio-list="youtube-dl $list $metadata $extract mp3" # playlist audio
alias yt-all-list="youtube-dl -o '$ruta%(title)s/%(playlist_index)s - %(title)s.%(ext)s' --add-metadata -f 'mp4,m4a'"
alias yt-video-unlist="youtube-dl $list2 --add-metadata -f mp4"
alias yt-audio-unlist="youtube-dl $list2 $metadata $extract mp3"
alias yt-all-unlist="youtube-dl -o '$ruta%(title)s/%(title)s.%(ext)s' --add-metadata -f 'mp4,m4a'"

alias yt-conf=$EDITOR "~/.config/youtube-dl/config" # editor
