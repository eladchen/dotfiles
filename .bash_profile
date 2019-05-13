# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done

unset file

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# highlighting inside manpages and elsewhere
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
export HISTTIMEFORMAT='%F %T '

# keep history up to date, across sessions, in realtime
# http://unix.stackexchange.com/a/48113
export HISTCONTROL="erasedups:ignoreboth"       # no duplicate entries
export HISTSIZE=100000                          # big big history (default is 500)
export HISTFILESIZE=$HISTSIZE                   # big big history

# Make some commands not show up in history
export HISTIGNORE="cd -:bg:fg:history:clear:pwd;exit:date:* --help"

type shopt &> /dev/null && {
	# Autocorrect on directory names to match a glob.
	shopt -s dirspell 2> /dev/null

	# Turn on recursive globbing (enables ** to recurse all directories)
	shopt -s globstar 2> /dev/null

	# Case-insensitive globbing (used in pathname expansion)
	shopt -s nocaseglob

	# Append to the Bash history file, rather than overwriting it
	shopt -s histappend

	# Autocorrect typos in path names when using `cd`
	shopt -s cdspell

	# Save multi-line commands as one command
	shopt -s cmdhist

	# Enable some Bash 4 features when possible:
	# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
	# * Recursive globbing, e.g. `echo **/*.txt`
	for option in autocd globstar; do
		shopt -s "$option" 2> /dev/null
	done
}

# quit now if in zsh
if [[ -n "$ZSH_VERSION" ]]; then
    return 1 2> /dev/null || exit 1;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults
