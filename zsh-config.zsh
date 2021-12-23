plugins=(
alias-finder
autojump
colored-man-pages
colorize
command-not-found
common-aliases
compleat
copybuffer
copydir
copyfile
cp
dirhistory
extract
fzf-tab 
git
jsontools
npm
sudo
systemadmin
systemd
tmux
zsh-autosuggestions
zsh-syntax-highlighting 
# zsh-autocomplete
)



# install plugins with zplug
source ~/.zplug/init.zsh
# plugins 
zplug "b4b4r07/enhancd", use:init.sh
zplug load
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit bashcompinit
compinit
bashcompinit
# source ~/.bash_completion.d/compleat_setup

# plugins configurations
#
# aliases-finder
ZSH_ALIAS_FINDER_AUTOMATIC=true

# tmux configuration
export ZSH_TMUX_CONFIG=$HOME/.config/tmux/tmux.conf
export ZSH_TMUX_AUTOSTART=true
