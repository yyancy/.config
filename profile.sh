# source aliases file
SHELL_HOME="$HOME/.config/shell"
source "$SHELL_HOME/plugins.zsh"
source "$SHELL_HOME/color.sh"
source "$SHELL_HOME/helper.zsh"
source "$SHELL_HOME/env.sh"
source "$SHELL_HOME/aliases.sh"
source "$SHELL_HOME/clipboard.zsh"
source "$SHELL_HOME/fzf.zsh"
source "$SHELL_HOME/keys.zsh"

test -d $HOME/.cargo && {
  . "$HOME/.cargo/env"
}

# define relevant variables
export GIT_SSL_NO_VERIFY=1

# some stuffs

# command line history tool
# HSTR configuration - add this to ~/.zshrc
has hstr && {
  alias hh=hstr          # hh to be alias for hstr
  setopt histignorespace # skip cmds w/ leading space from history
  export HSTR_CONFIG=hicolor,raw-history-view
  bindkey -s "\C-r" "\C-a hstr -- \C-j" # bind hstr to Ctrl-r (for Vi mode check doc)
  export HSTR_TIOCSTI=y
}

# 21century learning usage
go_libs="-lm"
go_flags="-g -Wall -include allheads.h -O3"
alias go_c="c99 -xc - $go_libs $go_flags"

bindkey '^[' vi-cmd-mode

# fzf-tab
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' fzf-flags --height=30%

# some program configurations
#
# zoxide
has zoxide && eval "$(zoxide init zsh)"
has thefuck && eval "$(thefuck --alias)"
has atuin && eval "$(atuin init zsh --disable-up-arrow)"
has mise && eval "$(mise activate zsh)"
