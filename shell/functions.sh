#!/usr/bin/env sh

python_environment() {
	# build python environment and activate.
	echo '🏗️ Build environment'
	python -m venv .venv
	echo '🏃 run environment'
	. .venv/bin/activate
	# Install linter, formatter and test
	.venv/bin/pip install pylint black pytest
	# Install required packages
	.venv/bin/pip install -r requirements.txt
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
	# export archlinux packages to file
	echo "# Packages installed on $(uname -n) on $(date +'%Y-%m-%d %H.%M.%S')" >~/packages-installes.txt
	pacman -Qq >>~/packages-installes.txt
}

start_server(){
	python3 -m http.server
}
