# add go relevant configurations
export PATH=/usr/local/go/bin:$PATH
export GOPROXY=https://goproxy.io,direct
export GO111MODULE="on"
export GOPATH="$HOME/.cache/go"

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
