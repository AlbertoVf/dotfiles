#!/bin/bash
export EDITOR="nvim"

alias ag="alias | grep"
alias example="tldr"
alias find="fd"
alias grep="grep --color"
alias h="history"
alias s="sudo"

# Folders alias{
  # Show files and dirs: sorted by type, icons, readable
  alias ls="exa --icons -tR -s type"
  # long format, sorted by type, view octal permissions
  alias l="exa -lh -s type --octal-permissions --time-style long-iso"
  alias lsa="exa --icons -a -s type" # all files and dirs, sorted by type
  # long format, sorted by type, view octal permissions
  alias la="exa -alh -s type --octal-permissions --time-style long-iso"
  alias lg="exa -laGRTh -I .git --no-user --no-time --no-filesize --no-permissions -rs modified --octal-permissions --git-ignore --git"
  alias ll="exa -1@ | grep '\->' | awk -F '->' '{ print $1 }'"
  alias lt="exa -aT --icons" # tree listing

  alias cp="cp -i"
  alias mkdir="mkdir -pv"
  alias mv="mv -i"
  alias rm="rm -i"
# }

# packages alias {

  alias pacin="sudo pacman -S"                      # install package
  alias pacrem="sudo pacman -Rns"                   # remove package and dependencies
  alias pacsyu="sudo pacman -Syyu"                  # update only standard pkgs
  alias unlock="sudo rm /var/lib/pacman/db.lck"     # remove pacman lock

  alias parsua="sudo paru -Sua"                     # update aur packages
  alias parsyu="sudo paru -Syu"                     # update standar packages and aur

  alias ain="sudo aura -A"                          # install aur package
  alias ad="sudo aura -C"                           # downgrade a package
  alias aup="sudo aura -Akua"                       # upgrade all aur packages
  alias aclean="sudo aura -Cc 2"                    # clean packages, retains 2 last packages
  alias ab="sudo aura -B"                           # save packages state
  alias cleanup="sudo aura -Oj"                     # cleanup orphaned packages
# }

# git alias {
  alias branch="git branch"
  alias checkout="git checkout"
  alias clone="git clone"
  alias diff="git diff"
  alias fetch="git fetch"
  alias ga="git add"
  alias gaa="git add --all"
  alias gau="git add -u"
  alias gc="git commit -m"
  alias gl="git log --oneline --decorate --all --graph"
  alias gls="git log --stat"
  alias gst="git status"
  alias pull="git pull origin"
  alias push="git push origin"
  alias remotes="git remote -v"
# }

# Dotfiles alias {
  alias dotfiles="/usr/bin/git --git-dir=$(xdg-user-dir DOTFILES) --work-tree=$HOME"
  alias dota="dotfiles add -u"
  alias dotc="dotfiles commit -m"
  alias dotd="dotfiles diff"
  alias dotl="dotfiles log --oneline --decorate --all --graph"
  alias dotp="dotfiles push"
  alias dotst="dotfiles status"
# }

# function alias {
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
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar) z x ./"$n";;
            *.bz2) bunzip2 ./"$n";;
            *.cba|*.ace) unace x ./"$n";;
            *.cbr|*.rar) unrar x -ad ./"$n";;
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) tar xvf "$n";;
            *.cbz|*.epub|*.zip) unzip ./"$n";;
            *.cpio) cpio -id < ./"$n";;
            *.exe) cabextract ./"$n";;
            *.gz) gunzip ./"$n";;
            *.lzma) unlzma ./"$n";;
            *.xz) unxz ./"$n";;
            *.z) uncompress ./"$n";;
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
            *.bash) bash ./"$n";;
            *.java) java ./"$n";;
            *.jpg|*.jpeg|*.png|*.bmp|*.gif) feh ./"$n";;
            *.mp4|*.mp3|*.m4a|*.aac|*.flac) mpv ./"$n";;
            *.pdf) evince ./"$n";;
            *.py) python ./"$n";;
            *.sh) sh ./"$n";;
            *.ts|*.js) deno run ./"$n";;
            *.zsh) zsh ./"$n";;
            *) $EDITOR ./"$n"
          esac
        else
          echo "'$n' - file does not exist"
          return 1
        fi
      done
    fi
  }
# }

# Youtube-dl alias {
  ruta="$(xdg-user-dir DOWNLOAD)/"
  metadata="--embed-thumbnail --add-metadata"
  extract="--extract-audio --audio-quality 0 --audio-format"
  file="-o $ruta'%(title)s.%(ext)s' --no-playlist"
  list="-o $ruta'%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'"
  list2="-o $ruta'%(playlist)s/%(title)s.%(ext)s'"

  # youtube audio
  alias yt-aac="youtube-dl $metadata $extract aac $file"
  alias yt-flac="youtube-dl $metadata $extract flac $file"
  alias yt-m4a="youtube-dl $metadata $extract m4a $file"
  alias yt-mp3="youtube-dl $metadata $extract mp3 $file"
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
# }
