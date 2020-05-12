# uncomment to profile prompt startup with zprof
# zmodload zsh/zprof

# vim bindings
# bindkey -v

## History configuration
SAVEHIST=100000
HISTFILE="$HOME/.zsh_history"
ZSH_CACHE_DIR="$HOME/.zsh_cache"

if [[ ! -a $ZSH_CACHE_DIR ]]; then mkdir $ZSH_CACHE_DIR; fi

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# https://stackoverflow.com/a/26848769
alias history='history 1'

# antigen time! (assumes brew installation path)
source $(brew --prefix antigen)/share/antigen/antigen.zsh

# Customize "pure" prompt colors
zstyle :prompt:pure:branch    color yellow
zstyle :prompt:pure:success   color green
zstyle :prompt:pure:exec_time color white

antigen bundles <<EOF
	# oh-my-zsh's library takes too long. do not use it.
	# antigen use oh-my-zsh

	# Specific oh-my-zsh plugins
	# @see https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
	# ===============================================================

	# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/kubectl
	robbyrussell/oh-my-zsh plugins/kubectl

	# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/osx
	# TODO: This fails misreably - We can fix that create PR
	# robbyrussell/oh-my-zsh plugins/osx

	# nicoulaj's moar completion files for zsh -- not sure why disabled.
	# zsh-users/zsh-completions src

	# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#extract
	robbyrussell/oh-my-zsh plugins/extract

	# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/jsontools
	robbyrussell/oh-my-zsh plugins/jsontools

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

	# https://github.com/robbyrussell/oh-my-zsh/tree/master/lib
	robbyrussell/oh-my-zsh lib/functions.zsh
	# ==========

	# A magical 'cd' alternative
	# https://github.com/rupa/z
	rupa/z

	# https://github.com/wfxr/forgit
	wfxr/forgit

	# https://github.com/zsh-users/zsh-syntax-highlighting
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
autoload -U      up-line-or-beginning-search
autoload -U      down-line-or-beginning-search
zle      -N      up-line-or-beginning-search
zle      -N      down-line-or-beginning-search
bindkey "^[[A"   up-line-or-beginning-search
bindkey "^[[B"   down-line-or-beginning-search
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# bindkey '`'  autosuggest-accept
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
source $HOME/.bash_profile