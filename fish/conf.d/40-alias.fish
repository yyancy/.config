# Aliases. Mirrors shell/core/aliases.sh — keep the two in sync.

# navigation
alias cd.. "cd ../"
alias .. "cd ../"
alias ... "cd ../../../"
alias .... "cd ../../../../"
alias .4 "cd ../../../../"
alias .5 "cd ../../../../../"

# ls (eza)
if type -q eza
    alias ls "eza --group-directories-first"
    alias l "eza --group-directories-first"
    alias ll "eza --group-directories-first -l"
    alias la "eza --group-directories-first -a"
    alias lla "eza --group-directories-first -l -a"
    alias lr "eza --group-directories-first -l -T"
    alias lx "eza --group-directories-first -l -sextension"
    alias lk "eza --group-directories-first -l -ssize"
    alias lt "eza --group-directories-first -l -smodified"
    alias lc "eza --group-directories-first -l -schanged"
end

# git
alias g "git"
alias gst "git status"
alias gl "git pull"

# docker
alias dps "docker ps"
alias dc "docker compose"

# safer file operations
alias cp "cp -iv"
alias mv "mv -iv"
alias rm "rm -vI"
alias mkd "mkdir -pv"
alias mk "mkdir -pv"
alias modx "chmod +x"

# system info
alias ping "ping -n"
alias os "cat /etc/lsb-release"
alias ipc "ip -br -c"
alias mem "free -h"
alias mydf "df -h -x squashfs"
alias pg "ps -ef | grep"

# misc
alias bc "bc -ql"
alias c "clear"
alias g28 "iconv -f gbk -t utf-8"
alias less "less --incsearch --ignore-case -j.3"
alias mux "tmuxinator"

# A function, not an alias: $PATH must expand at call time, not definition time.
function ssudo --description 'sudo preserving the current PATH'
    sudo -E env "PATH=$PATH" $argv
end

if type -q nvim
    alias vi "nvim"
    alias vim "nvim"
    alias nv "nvim"
    alias vimdiff "nvim -d"
end
type -q trash-put; and alias trp "trash-put"
type -q lazygit; and alias lg "lazygit"
type -q joshuto; and alias ranger "joshuto"
