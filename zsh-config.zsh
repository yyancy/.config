plugins=(
git
extract
fzf-tab 
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
systemadmin
systemd
tmux
alias-finder
copybuffer
copydir
copyfile
jsontools
common-aliases
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


# tmux configuration
export ZSH_TMUX_CONFIG=$HOME/.config/tmux/tmux.conf
export ZSH_TMUX_AUTOSTART=true
