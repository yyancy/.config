# some aliases

alias reload='source ~/.zshrc'

alias cd..='cd ../'
alias ..='cd ../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

has eza && {
  alias ls='eza --group-directories-first'

  alias ll='ls -l'          # Long format, git status
  alias l='ll -a'           # Long format, all files
  alias lr='ll -T'          # Long format, recursive as a tree
  alias lx='ll -sextension' # Long format, sort by extension
  alias lk='ll -ssize'      # Long format, largest file size last
  alias lt='ll -smodified'  # Long format, newest modification time last
  alias lc='ll -schanged'   # Long format, newest status change (ctime) last
}

alias g='git'
alias gst='git status'
alias gl='git pull'

alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"
alias bc="bc -ql"
alias mkd="mkdir -pv"
alias ranger='joshuto'

alias ping='ping -n'
alias os="cat /etc/lsb-release"
alias ipc='ip -br -c'
alias mem="free -h"
alias mydf='df -h -x squashfs'
alias mk='mkdir -pv'
alias sudo='sudo '
alias c='clear'
alias pg='ps -ef | grep'
alias languagetool='java -jar /home/yancy/tmp/languagetool/languagetool-standalone/target/LanguageTool-5.6-SNAPSHOT/LanguageTool-5.6-SNAPSHOT/languagetool-commandline.jar'
alias modx='chmod +x '
alias ssudo='sudo -E env "PATH=$PATH"'

alias g28='iconv -f gbk -t utf-8'
# alias fd='fdfind'
alias less='less --incsearch --ignore-case -j.3'
# alias man='man -P "less --incsearch --ignore-case"'
alias mux='tmuxinator'

has nvim && alias vim="nvim" vi="nvim" nv="nvim" vimdiff="nvim -d"
has trash-put && alias trp="trash-put"
has lazygit && alias lg='lazygit'

# extension aliases
alias -s txt=nvim
alias -s md=typora
alias -s pdf=FoxitReader

# unset some aliases
# unalias duf
