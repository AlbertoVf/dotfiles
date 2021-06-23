
# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"
export EDITOR="nvim"
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

ZSH_THEME="spaceship" # mikeh, nano
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

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
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
              tar xvf "$n"       ;;
            *.lzma)
              unlzma ./"$n"      ;;
            *.bz2)
              bunzip2 ./"$n"     ;;
            *.cbr|*.rar)
              unrar x -ad ./"$n" ;;
            *.gz)
              gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)
              unzip ./"$n"       ;;
            *.z)
              uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
              z x ./"$n"        ;;
            *.xz)
              unxz ./"$n"        ;;
            *.exe)
              cabextract ./"$n"  ;;
            *.cpio)
              cpio -id < ./"$n"  ;;
            *.cba|*.ace)
              unace x ./"$n"      ;;
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

plugins=(
  colored-man-pages
  colorize
  command-not-found
  themes
  gitignore
  youtube-dl
  zsh-autosuggestions
  zsh-interactive-cd
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
alias ag="alias | grep"
alias s="sudo"
alias reload="clear && . ~/.zshrc"
alias cat="ccat"
alias vim="nvim"
alias less="cless"
alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file

# ls, the common ones I use a lot shortened for rapid fire usage
alias l='exa -tRFh'   	#sorted by date,recursive,show type,human readable
alias ls='exa -l --color=always --group-directories-first'  # long format
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias lsa='exa -al --color=always --group-directories-first' # my preferred listing
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

alias grep='grep --color'
alias h='history'
alias help='man'
# files and folders
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
# GIT ALIASES
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gd='git diff'
alias gl='git log --graph'
alias glg='git log --stat'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gr='git restore'
alias gra='git restore :/'
alias grem='git remote -v'
alias gst='git status'
alias gt='git tag -a'
# PACMAN ALIASES - Paru
alias pacin='sudo pacman -S'
alias pacins='sudo pacman -U'
alias paclsorphans='sudo pacman -Qdt'
alias pacre='sudo pacman -R'
alias pacrem='sudo pacman -Rns'
alias pacupg='sudo pacman -Syu'
alias pacsyu='sudo pacman -Syyu'                 # update only standard pkgs
alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock

# DOTFILES
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

