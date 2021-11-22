# source aliases file
DT_HOME="$HOME/.config/shell"
# shellcheck source=/dev/null
source "$DT_HOME/aliases.sh"
# shellcheck source=/dev/null
source "$DT_HOME/functions.sh"
# shellcheck source=/dev/null
source "$DT_HOME/env.sh"

[ -x "$(command -v thefuck)" ] && eval "$(thefuck --alias)"


# define relevant variables
export GIT_SSL_NO_VERIFY=1









# execute some other extra work

# switch Esc key and Caps key
# [ -x "$(command -v xmodmap)" ] && xmodmap ~/.Xmodmap
[ -x "$(command -v setxkbmap)" ] && setxkbmap -option caps:swapescape
