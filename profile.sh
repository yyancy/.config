# source aliases file
DT_HOME="$HOME/.config/shell"
if [ -f "$DT_HOME/aliases.sh" ]; then 
	. "$DT_HOME"/aliases.sh
fi

# source functions file

if [ -f "$DT_HOME/functions.sh" ]; then 
	. "$DT_HOME"/functions.sh
fi

if [ -f "$DT_HOME/env.sh" ]; then 
	. "$DT_HOME"/env.sh
fi



[ -x "$(command -v thefuck)" ] && eval "$(thefuck --alias)"



# add go relevant configurations
if [ -x "$(command -v go )" ]; then
  export PATH=$PATH:/usr/local/go/bin
  export GOPROXY=https://goproxy.io,direct
  export GO111MODULE="on"
  export GOPATH="$HOME/.cache/go"
fi
# define relevant variables
export GIT_SSL_NO_VERIFY=1

# add path
PATH="/usr/local/mysql/bin:$PATH"
PATH="/usr/local/lib/nodejs/node/bin:$PATH"
PATH="$HOME/.jdks/jdk/bin:$PATH"
PATH="$PATH:/opt/maven/bin"
PATH="$HOME/.yarn/bin:$PATH"

export PATH=$HOME/.local/bin:$PATH
VERSION=v14.18.0
DISTRO=linux-x64
export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH


# remove duplicate items
export PATH=$( echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}' )
export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/bin"



# execute some other extra work

# switch Esc key and Caps key
# [ -x "$(command -v xmodmap)" ] && xmodmap ~/.Xmodmap
[ -x "$(command -v setxkbmap)" ] && setxkbmap -option caps:swapescape
