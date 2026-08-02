# External tool initialization.
# Consolidated here so the zsh side mirrors fish/conf.d/30-tool.fish.
# Requires `has` from zsh/helper.zsh.

# hstr — command line history browser.
# Kept before the `eval` inits below: hstr binds Ctrl-R, and atuin's init
# rebinds it afterwards, so atuin wins. Preserves the original load order.
has hstr && {
  alias hh=hstr
  setopt histignorespace
  export HSTR_CONFIG=hicolor,raw-history-view
  bindkey -s "\C-r" "\C-a hstr -- \C-j"
  export HSTR_TIOCSTI=y
}

has zoxide && eval "$(zoxide init zsh)"
has thefuck && eval "$(thefuck --alias)"
has atuin && eval "$(atuin init zsh --disable-up-arrow)"
has mise && eval "$(mise activate zsh)"

test -d "$HOME/.cargo" && . "$HOME/.cargo/env"
