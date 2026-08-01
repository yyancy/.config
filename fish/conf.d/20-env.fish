# Environment variables for fish.
# Mirrors shell/env.sh — intentional duplication to keep fish config self-contained.
# When updating env vars, update both files.

set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CACHE_HOME $HOME/.cache

# Go
set -gx GOPROXY https://proxy.golang.com.cn,direct
set -gx GO111MODULE on
set -gx GOPATH $HOME/.cache/go

# Proxy — auto-detect local proxy on port 7890 (e.g. clash/v2ray)
if ss -tnl 2>/dev/null | grep -q 7890
    set -gx http_proxy http://127.0.0.1:7890
    set -gx https_proxy http://127.0.0.1:7890
end

# PATH — fish_add_path deduplicates automatically
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.yarn/bin
fish_add_path $HOME/.cache/go/bin
fish_add_path /opt/maven/bin
fish_add_path /usr/local/mysql/bin

set -gx MANPAGER "less -FR --incsearch --ignore-case -j.3"
set -gx BAT_PAGER "less -FR --incsearch --ignore-case -j.3"

if test -f ~/.secrets/env.fish
    source ~/.secrets/env.fish
end
