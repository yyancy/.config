
export EDITOR="nvim"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/.config"

# add go relevant configurations
export GOPROXY=https://proxy.golang.com.cn,direct
export GO111MODULE="on"
export GOPATH="$HOME/.cache/go"

# add path
pathprepend "$HOME/.cache/go/bin"
pathprepend "$HOME/.yarn/bin"
pathprepend "$HOME/.local/bin"
pathprepend "/opt/maven/bin"
pathprepend "/usr/local/mysql/bin"
# remove duplicate items
export PATH=$( echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}' )
