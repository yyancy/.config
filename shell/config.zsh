# Main entry point for zsh interactive sessions.
# Sourced from zsh/.zshrc. Loads shell/core/* (POSIX-portable) then shell/zsh/*.
#
# Order matters:
#   plugins    — Zim init; must come first so modules are available below
#   color      — ANSI color vars used by later modules
#   helper     — defines `has` and `pathprepend`, needed by env/aliases/tools
#   env        — environment variables and PATH (uses pathprepend)
#   aliases    — uses `has` for conditional aliases
#   tools      — external tool init (uses `has`)
#   completions— fzf-tab styling; needs the plugin loaded by plugins.zsh

SHELL_HOME="${SHELL_HOME:-$HOME/.config/shell}"

source "$SHELL_HOME/zsh/plugins.zsh"

source "$SHELL_HOME/core/color.sh"
source "$SHELL_HOME/zsh/helper.zsh"
source "$SHELL_HOME/core/env.sh"
source "$SHELL_HOME/core/aliases.sh"

source "$SHELL_HOME/zsh/clipboard.zsh"
source "$SHELL_HOME/zsh/fzf.zsh"
source "$SHELL_HOME/zsh/keybindings.zsh"
source "$SHELL_HOME/zsh/tools.zsh"
source "$SHELL_HOME/zsh/completions.zsh"

# Disable SSL cert verification — needed for corporate/internal git servers
# with self-signed certs.
export GIT_SSL_NO_VERIFY=1

# Escape enters vi command mode. Set here rather than in keybindings.zsh so it
# takes effect after every plugin has finished binding keys.
bindkey '^[' vi-cmd-mode

# ---------------------------------------------------------------------------
# Local / secret overrides — loaded last so they can override anything above.
# All gitignored or outside the repo.
# ---------------------------------------------------------------------------
[ -f "$SHELL_HOME/local.zsh" ] && source "$SHELL_HOME/local.zsh"
[ -f "$SHELL_HOME/env.local.sh" ] && source "$SHELL_HOME/env.local.sh"
[ -f "$HOME/.secrets/env.sh" ] && source "$HOME/.secrets/env.sh"
