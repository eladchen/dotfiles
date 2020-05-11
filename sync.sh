#!/bin/bash
cd "$(dirname "$0")"

git pull

function doIt() {
	rsync --exclude "\.?git|osx-defaults|gitignore|icons|osx|DS_Store|sync.sh|README.md|installers|idea" -av . ~
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