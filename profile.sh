# source aliases file
SHELL_HOME="$HOME/.config/shell"
# shellcheck source=/dev/null
source "$SHELL_HOME/color.sh"
# shellcheck source=/dev/null
source "$SHELL_HOME/aliases.sh"
# shellcheck source=/dev/null
source "$SHELL_HOME/functions.sh"
# shellcheck source=/dev/null
source "$SHELL_HOME/env.sh"

source "$SHELL_HOME/bashmarks.sh"
[ -x "$(command -v thefuck)" ] && eval "$(thefuck --alias)"


# define relevant variables
export GIT_SSL_NO_VERIFY=1


# execute some other extra work

# switch Esc key and Caps key
# [ -x "$(command -v xmodmap)" ] && xmodmap ~/.Xmodmap
# [ -x "$(command -v setxkbmap)" ] && setxkbmap -option caps:swapescape

# some stuffs

# command line history tool
# HSTR configuration - add this to ~/.zshrc
[ -x "$(command -v hstr)" ] && {
  alias hh=hstr                    # hh to be alias for hstr
  setopt histignorespace           # skip cmds w/ leading space from history
  export HSTR_CONFIG=hicolor       # get more colors
  bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
}

# 21century learning usage
go_libs="-lm"
go_flags="-g -Wall -include allheads.h -O3"
alias go_c="c99 -xc - $go_libs $go_flags"
