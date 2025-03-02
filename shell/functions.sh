#!/usr/bin/env sh

add_submodule() {
	# add submodule with github url.
	# Submodule dest folder is the submodule name
	module=$1
	name=$(echo $module | rev | cut -d'/' -f1 | rev)
	name=$(echo $name | sed 's/\.git//g')
	git submodule add $module $name
}

export_packages() {
	# export archlinux packages to file
	echo "# Packages installed on $(uname -n) on $(date +'%Y-%m-%d %H.%M.%S')" >~/packages-installes.txt
	pacman -Qq >>~/packages-installes.txt
}

start_server(){
	IP="$(ip -4 addr show enp3s0f1 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')"
	PORT=8000

	URL="http://$IP:$PORT"
	echo "Server started at http://$URL"
	curl -s "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=$URL" | kitten icat

	python3 -m http.server $PORT --bind $IP
}
