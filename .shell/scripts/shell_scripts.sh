#!/bin/sh

function init_repo() {
	# init_repo 'name-app' 'language1 language2...' 'license'
	name=$1
	ignore=$2
	license=$3
	files=('LICENSE.md' 'README.md' '.gitignore' '.editorconfig' '.env' 'Makefile')

	mkdir -p $name/{src,test,dist,assets/{img,docs},.github/workflows} && cd $name && git init

	echo "# $name" >>README.md
	if [ $ignore ]; then
		gitignores="${ignore//" "/","}"
		curl -fLw '\n' https://www.gitignore.io/api/$gitignores >>.gitignore
	fi

	if [ $license ]; then
		response=$(curl -sLX GET "https://api.github.com/licenses/$license" | jq ".body")
		echo -en $response >LICENSE.md
		sed -Ee 's/(\\"|\")//g' \
			-e s/"\[year\]"/"$(date +%Y)"/g \
			-e s/"\[fullname\]"/"$(git config user.name)"/g \
			-i LICENSE.md
	fi

	for i in "${files[@]}"; do
		if [ -s $i ]; then
			git add $i
		else
			echo "🧪 Generate the $i file" # && touch $i
		fi
	done

	git commit -m "🎉 init(build): Set project environment."
	code . #&& exit
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

function watch() {
	if [[ $1 =~ '^[https? | ftps?]' ]]; then
		xdg-open $1
	elif [[ $1 =~ ^[0-9]{1,5}$ ]]; then
		xdg-open "http://localhost:$1"
	else
		bat "./$1" || cat "./$1" || less "./$1"
	fi
}

function run() {
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

function clear_marks() {
	# remove marks (') from a file
	sed -i "s/'//g" $1
}

function create_playlist() {
	folder_name="$(pwd | awk -F '/' '{print $NF}')"
	name="playlist_$folder_name.m3u"

	echo -e "# $(date) - $(pwd)\n" >$name
	fd -a -d1 -e mp3 -e mp4 >>$name
}

function my_ip() {
	scripts="$(xdg-user-dir SHELLSCRIPTS)"
	python $scripts/my_ip.py -i | bat -l json
	python $scripts/my_ip.py -c | bat -l json
	# python $scripts/my_ip.py -s | bat -l json
}

function convert_image() {
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
