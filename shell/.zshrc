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

# antigen time! (assumes brew installation path)
source $(brew --prefix antigen)/share/antigen/antigen.zsh

antigen init .antigenrc

# Configure "pure"
zstyle :prompt:pure:git:branch color yellow
zstyle :prompt:pure:success    color green
zstyle :prompt:pure:exec_time  color white

export PURE_GIT_UNTRACKED_DIRTY=0

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

# Load default dotfiles
source $HOME/.bash_profile