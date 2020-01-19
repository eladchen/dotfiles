# uncomment to profile prompt startup with zprof
# zmodload zsh/zprof

# vim bindings
# bindkey -v

fpath=( "$HOME/.zfunctions" $fpath )

## History configuration
SAVEHIST=100000
HISTFILE="$HOME/.zsh_history"

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
# setopt hist_verify          # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

# antigen time! (assumes brew installation path)
source /usr/local/share/antigen/antigen.zsh
#source $HOME/antigen.zsh

# Customize "pure" prompt colors
zstyle :prompt:pure:branch    color yellow
zstyle :prompt:pure:success   color green
zstyle :prompt:pure:exec_time color white

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

	# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/yarn
	robbyrussell/oh-my-zsh lib/functions.zsh

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

	# https://github.com/trapd00r/zsh-syntax-highlighting-filetypes
	trapd00r/zsh-syntax-highlighting-filetypes

	# sindresorhus's "pure" (lightweight theme with prompt)
	# https://github.com/mafredri/zsh-async
	# https://github.com/sindresorhus/pure
	mafredri/zsh-async
	# sindresorhus/pure <- Until the source repo supports coloring, use my fork.
	eladchen/pure --branch=zstyle-colors
EOF

# Tell antigen that you're done.
antigen apply

# Configure "pure"
export PURE_GIT_UNTRACKED_DIRTY=0

###
#################################################################################################

# bind UP and DOWN arrow keys for history search
zmodload zsh/terminfo

# fuzzy find history traversal using [Up-Arrow] / [Down-Arrow]
# https://github.com/robbyrussell/oh-my-zsh/blob/486fa1010df847bfd8823b4492623afc7c935709/lib/key-bindings.zsh#L31-L41
autoload -U    up-line-or-beginning-search
autoload -U    down-line-or-beginning-search
zle -N         up-line-or-beginning-search
zle -N         down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# bindkey '`'	 autosuggest-accept
# bindkey '``' autosuggest-execute

# Automatically list directory contents on `cd`.
function auto-ls() {
	emulate -L zsh;

	# explicit sexy ls'ing as aliases arent honored in here.
	hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls
}

chpwd_functions=( auto-ls $chpwd_functions )

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Disable /etc/hosts SSH Completion if it ever gets too big
# zstyle ':completion:*:ssh:*' hosts off

# uncomment to finish profiling
# zprof

# Load default dotfiles
source ~/.bash_profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh