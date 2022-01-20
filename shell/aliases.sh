# some aliases

alias reload='source ~/.zshrc'

alias cd..='cd ../'
alias ..='cd ../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

alias ls='exa -s=extension'
alias ll='ls -l'
alias l='ls -l'

alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"
alias bc="bc -ql"
alias mkd="mkdir -pv"

alias ping='ping -n'
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

alias g28='iconv -f gbk -t utf-8'
alias fd='fdfind'

[ -x "$(command -v nvim)" ] && alias vim="nvim" vi="nvim" nv="nvim" vimdiff="nvim -d"
[ -x "$(command -v trash-put)" ] && alias trp="trash-put"

# extension aliases
alias -s txt=nvim
alias -s md=typora
alias -s pdf=FoxitReader

# unset some aliases
unalias duf
