# some aliases

alias reload='source ~/.zshrc'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

alias ls='exa'
alias ll='exa -l'
alias l='exa -l'

alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"
alias bc="bc -ql"
alias mkd="mkdir -pv"

alias os="cat /etc/lsb-release"
alias ipc='ip -br -c'
alias mem="free -h"
alias mydf='df -h -x squashfs'
alias mk='mkdir -pv'
alias sudo='sudo '
alias cl='clear'
alias pg='ps -ef | grep'
alias languagetool='java -jar /home/yancy/tmp/languagetool/languagetool-standalone/target/LanguageTool-5.6-SNAPSHOT/LanguageTool-5.6-SNAPSHOT/languagetool-commandline.jar'
alias modx='chmod +x '
alias ssudo='sudo -E env "PATH=$PATH"'
[ -x "$(command -v nvim)" ] && alias vim="nvim" vi="nvim" nv="nvim" vimdiff="nvim -d"
