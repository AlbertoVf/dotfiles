#!/bin/sh

function init_repo() {
  mkdir -p $1/{src,test,assets/{img,fonts,js,css,docs}}
  cd $1
  touch LICENSE Makefile
  echo "# $1" >>README.md
  if [ $2 ]; then
    gitignores="${2//" "/","}"
    curl -fLw '\n' https://www.gitignore.io/api/$gitignores >>.gitignore
  fi
  git init && git add -A
  git commit -m "build: :hammer: Create proyect structure."
}

function visibility() {
  if [ ${1:0:1} = "." ]; then
    file=${1:1}
  else
    file=".$1"
  fi
  mv $1 $file
}

function extract() {
  case $file in
    *.gz) gunzip $file ;;
    *.bz2) bunzip2 $file ;;
    *.zip) unzip $file ;;
    *.tar) tar $file ;;
    *) echo no era un archivo comprimido ;;
  esac
}

function watch(){
  if [[ $1 =~ '^[https? | ftps?]' ]]; then
    xdg-open $1
  elif [[ $1 =~ ^[0-9]{1,5}$ ]]; then
    xdg-open "http://localhost:$1"
  else
    bat "./$1" || cat "./$1" || less "./$1"
  fi
}

function run(){
  file=$1
  extension="$(echo $file | cut -d '.' -f2-)"
  case $file in
    *.sh | *.zsh | *.bash) $extension $file ;;
    *.py) python $file ;;
    *.java) javac $file ;;
    *.c | *.h) gcc $file ;;
    *.cpp | *.hpp) g++ $file ;;
    *.js | *.ts) deno run $file ;;
    *.html | *.htm | *.xhtm) xdg-open $file ;;

    *.mp3 | *.mp4 | *.m4a | *.aac | *.flac) xdg-open $file ;;
    *.pdf) xdg-open $file ;;
    *.jpg | *.jpeg | *.png | *.gif | *.bmp | *.tiff | *.svg) feh $file ;;
    *) xdg-open $file ;;
  esac
}

function my_ip(){
  xdg-open "https://ipinfo.io/" &
  local_ip="$(ip route get 1.1.1.1 | grep -oP 'src \K[^ ]+')"
  external_ip="$(curl -s https://api.my-ip.io/ip)"
  echo -e "Local: $local_ip\nExternal: $external_ip"
  speedtest --single --simple
}

function clear_marks(){
  # remove marks (') from a file
  sed -i "s/'//g" $1
}