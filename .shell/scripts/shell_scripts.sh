#!/bin/sh

# functions in shell

function init_repo() {
  # init_repo 'name-app' 'language1 language2 ...'
  mkdir -p $1/{src,test,assets/{img,docs}} && cd $1
  files=('README.md' '.gitignore' '.editorconfig' 'Makefile' 'Dockerfile' 'docker-compose.yml' 'LICENSE.md')
  git init
  echo "# $1" >>README.md
  if [ $2 ]; then
    gitignores="${2//" "/","}"
    curl -fLw '\n' https://www.gitignore.io/api/$gitignores >>.gitignore
  fi
  for i in "${files[@]}"; do
    if [ -s $i ]; then
      git add $i
    else
      touch $i && echo "Generate the $i file"
    fi
  done
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
    *.7z) 7z x $file ;;
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
    *.php) php -f $file;;
    *.mp3 | *.mp4 | *.m4a | *.aac | *.flac) xdg-open $file ;;
    *.pdf) xdg-open $file ;;
    *.jpg | *.jpeg | *.png | *.gif | *.bmp | *.tiff | *.svg) feh $file ;;
    *) xdg-open $file ;;
  esac
}

function clear_marks(){
  # remove marks (') from a file
  sed -i "s/'//g" $1
}

function create_playlist(){
  folder_name="$(pwd | awk -F '/' '{print $NF}')"
  name="playlist_$folder_name.m3u"

  echo -e "# $(date) - $(pwd)\n" > $name
  fd -a -d1 -e mp3 -e mp4 >> $name
}

function my_ip(){
  scripts="$(xdg-user-dir SHELLSCRIPTS)"
  python $scripts/my_ip.py -i | bat -l json
  python $scripts/my_ip.py -c | bat -l json
  python $scripts/my_ip.py -s | bat -l json
}

function linked_page(){
# crear formulario con url y nombre del fichero
  OUTPUT=$(zenity --forms --title="Crea un link" --text="Crea un link a una pagina" --separator="," --add-entry="url de la pagina" --add-entry="nombre del fichero")
  accepted=$?
  if ((accepted != 0)); then
      echo "something went wrong"
      exit 1
  fi
  url=$(awk -F, '{print $1}' <<<$OUTPUT)
  nombre=$(awk -F, '{print $2}' <<<$OUTPUT)
  echo -e "[Desktop Entry]\nVersion=1.0\nType=Link\nName=$nombre\nComment=\nIcon=user-bookmarks\nURL=$url" > "$nombre".desktop
}