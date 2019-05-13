#!/bin/bash

S_PWD=$0

# bash install.sh [commit hash=HEAD]
function install() {
	local old_pwd=$PWD
	local commit_hash=${1:-"HEAD"}
	local CLONE_TO="revision"

	# CD into the folder containing this script
	cd -P -- "$(dirname -- "$S_PWD")" && pwd -P

	# Retrieve 'z' repository
	git clone https://github.com/rupa/z.git $CLONE_TO

	# Point to the selected commit hash
	[ $commit_hash != "HEAD" ] && git checkout $commit_hash

	echo

	echo "Make sure to use the z.sh source with each login shell"

	echo "e.g: echo 'source $PWD/$CLONE_TO/z.sh' >> .bash_profile"
	
	cd $old_pwd

	return $?
}

install

# cleanup
unset -f install
unset S_PWD

exit $?