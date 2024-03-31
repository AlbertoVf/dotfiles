#!/usr/bin/env bash

python_environment() {
	echo '🏗️ Build environment'
	python -m venv .venv
	echo '🏃 run environment'
	source .venv/bin/activate
	.venv/bin/pip install pylint black pytest
	.venv/bin/pip install -r requirements.txt
}

add_submodule() {
	module=$1
	name=$(echo $module | rev | cut -d'/' -f1 | rev)

	name=$(echo $name | sed 's/\.git//g')

	git submodule add $module $name
}
