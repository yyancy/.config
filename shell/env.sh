
export EDITOR="nvim"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/.config"

# add go relevant configurations
export GOPROXY=https://goproxy.io,direct
export GO111MODULE="on"
export GOPATH="$HOME/.cache/go"

# add path
PATH="/usr/local/mysql/bin:$PATH"
PATH="$HOME/.jdks/jdk/bin:$PATH"
PATH="/opt/maven/bin:$PATH"
PATH="$HOME/.yarn/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"

# remove duplicate items
export PATH=$( echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}' )
