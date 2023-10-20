#!/bin/sh

to_m4a() {
	for f in "$@"; do
		name=$(basename "$f")
		folder=$(dirname "$f")
		filename="${name%.*}"
		ffmpeg -i "$f" -c:v copy -c:a aac -strict experimental -b:a 192k "$folder/$filename.m4a"

		if [ $? -eq 0 ]; then
			echo "Convertido: $f -> $folder/$filename.m4a"
		else
			echo "Error al convertir: $f"
		fi
	done
}

to_mp3() {
	for f in "$@"; do
		name=$(basename "$f")
		folder=$(dirname "$f")
		filename="${name%.*}"
		ffmpeg -i "$f" -codec:v copy -codec:a mp3 -q:a 0 "$folder/$filename.mp3"
		if [ $? -eq 0 ]; then
			echo "Convertido: $f -> $folder/$filename.mp3"
		else
			echo "Error al convertir: $f"
		fi
	done
}

to_png(){
	for f in "$@"; do
		name=$(basename "$f")
		folder=$(dirname "$f")
		name="${name%.*}"
		convert "$f" -background white "$folder/$name.png"
		echo "Imagen convertida: $name -> $name.png"
	done
}

to_jpg(){
	for f in "$@"; do
		name=$(basename "$f")
		folder=$(dirname "$f")
		name="${name%.*}"
		convert -quality 100 "$f" "$folder/$name.jpg"
		echo "Imagen convertida: $name -> $name.jpg"
	done
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
	echo -e "#!/usr/bin/vlc\n# $(date)\n# $root\n" >$name
	fd "mp\d$" -a -d1 --base-directory $root >>$name
}

create_sxhkdrc() {
	input_file="$HOME/.dotfiles/doc/shortcuts.json"
	output_file="$HOME/.dotfiles/os/linux/sxhkd/sxhkdrc"

	cp -f $output_file $HOME/.config/sxhkd/sxhkdrc.old
	jq -r 'keys[] as $k | "\($k) \(.[$k] | to_entries[] | [.key, .value] | @tsv)"' "$input_file" >"$output_file"

	sed -i 's/^ //g' "$output_file"
	sed -i 's/\t/\n\t/g' "$output_file"

	sed -i "1i # Generated on $(date +'%Y-%m-%d %H:%M')" "$output_file"
	sed -i "1i #!/bin/sh" "$output_file"
	echo "Reiniciar sxhkd"
}

enable_service() {
	sudo systemctl start $1
	sudo systemctl enable $1
}

extract() {
	file=$1
	case $file in
	*.7z) 7z x $file ;;
	*.gz) gunzip $file ;;
	*.bz2) bunzip2 $file ;;
	*.zip) unzip $file ;;
	*.tar) tar $file ;;
	*) echo "no era un archivo comprimido" ;;
	esac
}

get_shortcuts() {
	echo -e '\033[1;34m KITTY \033[37;0m'
	grep '^map' $HOME/.config/kitty/kitty.conf | awk '{for (i=2; i <= NF; i++) printf "%s ", $i; printf "\n"}'

	echo -e '\033[1;34m SXHKDRC \033[37;0m'
	cat $HOME/.config/sxhkd/sxhkdrc | tail -n +2 | sed ':a;N;$!ba;s/\n\t/: /g'

	echo -e '\033[1;34m QTILE \033[37;0m'
	grep '^[[:space:]]*\(Key\|Click\|Drag\)' $HOME/.config/qtile/settings/keys.py | sed 's/^[[:space:]]*//'
}

init_repo () {
	files=('LICENSE.md' 'README.md' '.gitignore' '.editorconfig' '.env' 'Makefile' '.vscode/settings.json' '.vscode/code.code-snippets' '.vscode/tasks.json')

	folder=$(basename "$(pwd)")
	name="$(echo $folder | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')"

	mkdir -p src test assets/{data,img,docs} .github/{ISSUE_TEMPLATE,workflows} .vscode && git init
	echo "# $name" | sed 's/-/ /g' | tr '[:upper:]' '[:lower:]' | sed 's/\b[a-z]/\u&/g' >> README.md

	while getopts ":l:i:" opt; do
	case $opt in
		i)
			alias_properties=$(awk '/^\[alias\]/ {p=1; next} /^\[.*\]/ {p=0} p' ~/.gitconfig)
			echo -e "\n[alias]\n$alias_properties" >> .git/config

			ignore="$OPTARG"
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
			echo "🧪 Generate $i" | tee -a todo.md
		fi
	done

	git commit -m "🎉 init(build): Set project environment."
	code .
}

mount_disk() {
	label=$(lsblk -o LABEL | grep "$1")
	device=$(blkid -l -o device -t LABEL="$label")
	d="/run/media/$USER/$label"
	sudo mkdir -p "$d" && sudo mount "$device" "$d"
	echo "[MOUNTED] $device --> $d"
}

my_ip() {
	privada="$(ip addr show | grep 'inet.*brd' | awk '{print $2}' | cut -f1 -d'/' | head -n1)"
	publica="$(curl -s ifconfig.me | awk '{print $1}')"
	echo "{\"publica\":\"$publica\",\"privada\":\"$privada\"}" | jq '.'
	curl -s http://ip-api.com/json/$publica | jq '.'
}

refactor_files() {

	for archivo in *; do
		mimetype=$(file -b --mime-type "$archivo")
		mime=$(echo $mimetype | cut -d '/' -f1)
		type=$(echo $mimetype | cut -d '/' -f2)

		case $mime in
		audio) mv -v $archivo "$(xdg-user-dir MUSIC)/" ;;
		font) mv $archivo "$(xdg-user-dir USERFONTS)" ;;
		image) mv -v $archivo "$(xdg-user-dir PICTURES)/" ;;
		video) mv -v $archivo "$(xdg-user-dir VIDEOS)/" ;;
		esac

		case $type in
		pdf | *opendocument*) mv -v $archivo "$(xdg-user-dir DOCUMENTS)/" ;;
		*template) mv -v $archivo "$(xdg-user-dir TEMPLATES)/" ;;
		*rom | octet-stream) mv -v $archivo "$HOME/Games/" ;;
		esac
	done
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

visibility() {
	if [ ${1:0:1} = "." ]; then
		file=${1:1}
	else
		file=".$1"
	fi
	mv $1 $file
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
