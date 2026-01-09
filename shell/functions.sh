#!/usr/bin/env sh

reload(){
	if [ -n "$BASH_VERSION" ]; then
    	. $HOME/.bashrc
	elif [ -n "$ZSH_VERSION" ]; then
		. $HOME/.zshrc
	fi
	clear
}

add_submodule() {
	# add submodule with github url.
	# Submodule dest folder is the submodule name
	module=$1
	name=$(echo $module | rev | cut -d'/' -f1 | rev)
	name=$(echo $name | sed 's/\.git//g')
	git submodule add $module $name
}

export_packages() {
	aur="aur-installes.txt" # paquetes de AUR
	oficial="packages-installes.txt" # explicitamente instalados (paquetes oficiales)

	echo "# Packages installed on $(uname -n) at $(date +'%Y-%m-%d %H.%M.%S')" | tee $oficial $aur

	echo "# sudo pacman -S --needed - < $oficial" > $oficial
	pacman -Qqent >> "$oficial"

	echo "# aura -A --needed - < $aur" > $aur
	pacman -Qqm >> "$aur"
}

start_server(){
	IP="$(ip -4 addr show enp3s0f1 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')"
	PORT=8000
	URL="http://$IP:$PORT"
	curl -s "https://api.qrserver.com/v1/create-qr-code/?size=360x360&data=$URL" | kitten icat
	python3 -m http.server $PORT --bind $IP
}

github_origin(){
	git remote remove origin
	git remote add origin "https://github.com/$1"
	git remote -v
}

img2pdf() {
	if [ $# -eq 0 ]; then
		echo "No se ha pasado ningún parámetro"
	elif [ $# -eq 1 ]; then
		filepath=$1
		filename="${filepath##*/}"
		name="${filename%.*}"
		pdf=$name".pdf"
	else
		pdf="$(basename "$PWD").pdf"
	fi
	command img2pdf -o "$pdf" "$@"
	echo "Imagenes convertidas a PDF: $pdf"
}

pico2wave(){
	command pico2wave -l es-ES -w salida.wav "$@"
}
