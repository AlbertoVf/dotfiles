#!/bin/sh

init_repo () {
    # * init_repo -n "name" -l "license" -i "languages"
    files=('LICENSE.md' 'README.md' '.gitignore' '.editorconfig' '.env' 'Makefile')
    while getopts ":n:l:i:" opt; do
    case $opt in
        n)
            name="$(echo $OPTARG | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')"
            mkdir $name && cd $name && git init
            mkdir -p src test assets/{data,img,docs} .github/{ISSUE_TEMPLATE,workflows}
            echo "# $name" | sed 's/-/ /g' | tr '[:upper:]' '[:lower:]' | sed 's/\b[a-z]/\u&/g' >> README.md
        ;;
        i)
            ignore="$OPTARG,visualstudiocode,$(uname -s)"
            if [ $ignore ]; then
                gitignores="${ignore//" "/","}"
                curl -fLw '\n' https://www.gitignore.io/api/$gitignores >>.gitignore
            fi
        ;;
        l)
            license=$OPTARG
            if [ $license ]; then
                response=$(curl -sLX GET "https://api.github.com/licenses/$license" | jq ".body")
                echo -en $response >LICENSE.md
                sed -Ee 's/(\\"|\")//g' \
                    -e s/"\[year\]"/"$(date +%Y)"/g \
                    -e s/"\[fullname\]"/"$(git config user.name)"/g \
                    -i LICENSE.md
            fi
        ;;
    esac
    done

    for i in "${files[@]}"; do
        if [ -s $i ]; then
            git add $i
        else
            echo "🧪 Generate $i"
        fi
    done

    git commit -m "🎉 init(build): Set project environment."
    code . #//&& exit
}

visibility() {
    if [ ${1:0:1} = "." ]; then
        file=${1:1}
    else
        file=".$1"
    fi
    mv $1 $file
}

extract() {
    case $file in
    *.7z) 7z x $file ;;
    *.gz) gunzip $file ;;
    *.bz2) bunzip2 $file ;;
    *.zip) unzip $file ;;
    *.tar) tar $file ;;
    *) echo "no era un archivo comprimido" ;;
    esac
}

watch() {
    if [[ $1 =~ '^[https? | ftps?]' ]]; then
        xdg-open $1
    elif [[ $1 =~ ^[0-9]{1,5}$ ]]; then
        xdg-open "http://localhost:$1"
    else
        bat "./$1" || cat "./$1" || less "./$1"
    fi
}

run() {
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
    *.php) php -f $file ;;
    *.mp3 | *.mp4 | *.m4a | *.aac | *.flac) xdg-open $file ;;
    *.pdf) xdg-open $file ;;
    *.jpg | *.jpeg | *.png | *.gif | *.bmp | *.tiff | *.svg) feh $file ;;
    *) xdg-open $file ;;
    esac
}

create_playlist() {
    if [ $1 ]; then
        folder_name=$1
        root="$(pwd)/$1"
    else
        folder_name="$(pwd | awk -F '/' '{print $NF}')"
        root="$(pwd)"
    fi
    name="playlist_$folder_name.m3u"
    echo -e "# $(date)\n# $root\n" >$name
    fd "mp\d$" -a -d1 --base-directory $root >>$name
}

my_ip() {
    privada="$(ip addr show | grep 'inet.*brd' | awk '{print $2}' | cut -f1 -d'/' | head -n1)"
    publica="$(curl -s ifconfig.me | awk '{print $1}')"
    echo "\"publica\": $publica\n\"privada\": $privada" | bat -l json
}

convert_image() {
    image_extension="png"
    file=$1
    extension="$(echo $file | cut -d '.' -f2-)"
    name="$(echo $file | cut -d '.' -f1)"
    $name="$name.$image_extension"
    case $extension in
    jpg | jpeg) convert $file $name ;;
    webp) dwebp $file -o $name ;;
    bimp | bmp) mogrify -format $image_extension $file ;;
    esac
}

enable_service(){
    sudo systemctl start $1
    sudo systemctl enable $1
}

create_sxhkdrc(){
    folder="$HOME/.config/sxhkd"
    # Ruta del archivo JSON de entrada
    input_file="$folder/shortcuts.json"
    # Ruta del archivo de texto de salida
    output_file="$folder/sxhkdrc"

    cp -f $output_file $output_file.old

    # Extrae las claves y valores del archivo JSON para cada clave
    jq -r 'keys[] as $k | "\($k) \(.[$k] | to_entries[] | [.key, .value] | @tsv)"' "$input_file" > "$output_file"

    sed -i 's/^ //g' "$output_file"
    sed -i 's/\t/\n\t/g' "$output_file"

    sed -i "1i # Generated on $(date +'%Y-%m-%d %H:%M')" "$output_file"
}
