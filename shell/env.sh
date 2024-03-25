export EDITOR="nvim"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export MANPATH=:$MANPATH
export HISTFILE

# add go relevant configurations
export GOPROXY=https://proxy.golang.com.cn,direct
export GO111MODULE="on"
export GOPATH="$HOME/.cache/go"

# check whether set up a proxy
ss -tnl | grep 7890 &>/dev/null
[ $? -eq 0 ] && {
	export http_proxy=http://127.0.0.1:7890
	export https_proxy=http://127.0.0.1:7890
}

# Set PATH, MANPATH, etc., for Homebrew.
test -d /home/linuxbrew/.linuxbrew && {
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	export FPATH="/home/linuxbrew/.linuxbrew/share/zsh/site-functions:$FPATH"
}

# add path
pathprepend "$HOME/.cache/go/bin"
pathprepend "$HOME/.yarn/bin"
pathprepend "$HOME/.local/bin"
pathprepend "/opt/maven/bin"
pathprepend "/usr/local/mysql/bin"
# remove duplicate items
export PATH=$(echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')

export MANPAGER="less -FR --incsearch --ignore-case -j.3"
export BAT_PAGER="less -FR --incsearch --ignore-case -j.3"

# experiment settings
# zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
