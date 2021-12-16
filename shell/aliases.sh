# some aliases
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

alias os="cat /etc/redhat-release"
alias myip='ip -br -c a'
alias mem="free -h"

alias mk='mkdir -pv'
alias sudo='sudo '
alias cls='clear'
alias pp='ps -ef | grep '
alias languagetool='java -jar /home/yancy/tmp/languagetool/languagetool-standalone/target/LanguageTool-5.6-SNAPSHOT/LanguageTool-5.6-SNAPSHOT/languagetool-commandline.jar'
alias modx='chmod +x '
alias ssudo='sudo -E env "PATH=$PATH"'
[ -x "$(command -v nvim)" ] && alias vim="nvim" vi="nvim" nv="nvim" vimdiff="nvim -d"
