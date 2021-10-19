plugins=(
git
extract
command-not-found
compleat
colored-man-pages
cp
colorize
autojump
zsh-autosuggestions
zsh-syntax-highlighting 
dirhistory
npm
sudo
)



# install plugins with zplug
source ~/.zplug/init.zsh
# plugins 
zplug "b4b4r07/enhancd", use:init.sh
zplug load --verbose
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit bashcompinit
compinit
bashcompinit
source ~/.bash_completion.d/compleat_setup
