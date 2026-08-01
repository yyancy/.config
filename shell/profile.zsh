# Entry point for zsh interactive sessions.
# Sources all shell/ modules in order.
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

# Disable SSL cert verification — needed for corporate/internal git servers with self-signed certs.
export GIT_SSL_NO_VERIFY=1

# command line history tool
has hstr && {
  alias hh=hstr
  setopt histignorespace
  export HSTR_CONFIG=hicolor,raw-history-view
  bindkey -s "\C-r" "\C-a hstr -- \C-j"
  export HSTR_TIOCSTI=y
}


bindkey '^[' vi-cmd-mode

# fzf-tab
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' fzf-flags --height=30%

has zoxide && eval "$(zoxide init zsh)"
has thefuck && eval "$(thefuck --alias)"
has atuin && eval "$(atuin init zsh --disable-up-arrow)"
has mise && eval "$(mise activate zsh)"

[ -f "$SHELL_HOME/env.local.sh" ] && source "$SHELL_HOME/env.local.sh"
[ -f "$HOME/.secrets/env.sh" ] && source "$HOME/.secrets/env.sh"

[ -f "$ZDOTDIR/zshrc.local" ] && source "$ZDOTDIR/zshrc.local"
