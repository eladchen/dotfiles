#!/bin/bash
cd "$(dirname "$0")"

git pull

function doIt() {
	rsync -av --exclude '.gitignore' --exclude '.DS_Store' shell/ ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi

unset -f doIt

source ~/.bash_profile