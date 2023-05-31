# My zsh custom configurations
#
# Theme: powerlevel10k/powerlevel10k


plugins=(
aliases
colored-man-pages
command-not-found
# common-aliases
# compleat
copybuffer
copypath
copyfile
extract
# dirhistory
# fzf
git
# jsontools
# npm
# sudo
systemadmin
systemd
tmux
zsh-autosuggestions
zsh-syntax-highlighting 
# per-directory-history
# zsh-autocomplete
)

# install zsh-completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# install plugins with zplug
source ~/.zplug/init.zsh

# plugins 
# zplug "b4b4r07/enhancd", use:init.sh
zplug load

#
# plugins configurations
#

# resolve problem that pasting conntent very slowly when using zsh-autosuggestions
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# aliases-finder
ZSH_ALIAS_FINDER_AUTOMATIC=true

# enhancd 
# export ENHANCD_HOOK_AFTER_CD=ll

# tmux configuration
export ZSH_TMUX_CONFIG=$HOME/.config/tmux/tmux.conf
# export ZSH_TMUX_AUTOSTART=true

# per-directory-history
export HISTORY_BASE=$HOME/.cache/directory_history


bindkey '^[' vi-cmd-mode
# bindkey -A emacs main
# bindkey -M viins 'jj' vi-cmd-mode
