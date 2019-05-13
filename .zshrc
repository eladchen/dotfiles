# uncomment to profile prompt startup with zprof
# zmodload zsh/zprof

# history
SAVEHIST=100000

# vim bindings
# bindkey -v

fpath=( "$HOME/.zfunctions" $fpath )

# antigen time! (assumes brew installation path)
# source /usr/local/share/antigen/antigen.zsh
source $HOME/antigen.zsh

antigen bundles <<EOF
	# oh-my-zsh's library takes too long. do not use it.
	# antigen use oh-my-zsh

	# specific oh-my-zsh plugins
	# @see https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
	# ===============================================================

	# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#extract
	robbyrussell/oh-my-zsh plugins/extract

	# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/jsontools
	robbyrussell/oh-my-zsh plugins/jsontools

	# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/kubectl
	# requires having the kubectl binary installed
	# robbyrussell/oh-my-zsh plugins/kubectl

	# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/osx
	# TODO: This fails misreably - We can fix that create PR
	# robbyrussell/oh-my-zsh plugins/osx

	# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/jira
	robbyrussell/oh-my-zsh plugins/jira

	# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/pip
	robbyrussell/oh-my-zsh plugins/pip

	# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/urltools
	robbyrussell/oh-my-zsh plugins/urltools

	# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/web-search
	robbyrussell/oh-my-zsh plugins/web-search

	# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/yarn
	robbyrussell/oh-my-zsh plugins/yarn

	# A magical 'cd' alternative
	# https://github.com/rupa/z
	rupa/z

	# nicoulaj's moar completion files for zsh -- not sure why disabled.
	# zsh-users/zsh-completions src

	# syntax highlighting on the readline
	zsh-users/zsh-syntax-highlighting

	# https://github.com/zsh-users/zsh-history-substring-search
	zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

	# https://github.com/zsh-users/zsh-autosuggestions
	zsh-users/zsh-autosuggestions

	# https://github.com/
	trapd00r/zsh-syntax-highlighting-filetypes

	# sindresorhus's "pure" (lightweight theme with prompt)
	# https://github.com/mafredri/zsh-async
	# https://github.com/sindresorhus/pure
	mafredri/zsh-async
	sindresorhus/pure
EOF

# Tell antigen that you're done.
antigen apply

###
#################################################################################################

# bind UP and DOWN arrow keys for history search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '`' autosuggest-accept
bindkey '``' autosuggest-execute

export PURE_GIT_UNTRACKED_DIRTY=0

# Automatically list directory contents on `cd`.
function auto-ls() {
	emulate -L zsh;

	# explicit sexy ls'ing as aliases arent honored in here.
	hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls
}

chpwd_functions=( auto-ls $chpwd_functions )

# history mgmt
# http://www.refining-linux.org/archives/49/ZSH-Gem-15-Shared-history/
setopt inc_append_history
setopt share_history

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Disable /etc/hosts SSH Completion if it ever gets too big
# zstyle ':completion:*:ssh:*' hosts off

# uncomment to finish profiling
# zprof

# Load default dotfiles
source ~/.bash_profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh