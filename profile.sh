# source aliases file
SHELL_HOME="$HOME/.config/shell"
source "$SHELL_HOME/color.sh"
source "$SHELL_HOME/helper.sh"
source "$SHELL_HOME/env.sh"
source "$SHELL_HOME/aliases.sh"
source "$SHELL_HOME/plugins.zsh"
source "$SHELL_HOME/clipboard.zsh"
source "$SHELL_HOME/fzf.zsh"
source "$SHELL_HOME/keys.zsh"

export FPATH="/home/linuxbrew/.linuxbrew/share/zsh/site-functions:$FPATH"

# define relevant variables
export GIT_SSL_NO_VERIFY=1

# execute some other extra work

# switch Esc key and Caps key
# [ -x "$(command -v xmodmap)" ] && xmodmap ~/.Xmodmap
# [ -x "$(command -v setxkbmap)" ] && setxkbmap -option caps:swapescape

# some stuffs

# command line history tool
# HSTR configuration - add this to ~/.zshrc
has hstr && {
	alias hh=hstr          # hh to be alias for hstr
	setopt histignorespace # skip cmds w/ leading space from history
	export HSTR_CONFIG=hicolor,regexp-matching,raw-history-view
	bindkey -s "\C-r" "\C-a hstr -- \C-j" # bind hstr to Ctrl-r (for Vi mode check doc)
	export HSTR_TIOCSTI=y
}

# some program configurations
#
# zoxide
has zoxide && eval "$(zoxide init zsh)"
has thefuck && eval "$(thefuck --alias)"

# 21century learning usage
go_libs="-lm"
go_flags="-g -Wall -include allheads.h -O3"
alias go_c="c99 -xc - $go_libs $go_flags"

bindkey '^[' vi-cmd-mode

# fzf-tab
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
