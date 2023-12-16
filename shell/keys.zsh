# Configures bindings for jumping/deleting full and sub-words, similar to
# the keybindings in bash.

# Jumping:
# Alt + B                Backward sub-word
# Ctrl + Alt + B         Backward full-word
# Alt + F                Forward sub-word
# Ctrl + Alt + F         Forward full-word

# Deleting:
# Ctrl + W               Backward delete full-word
# Ctrl + Alt + H         Backward delete sub-word
# Alt + D                Forward delete sub-word
# Ctrl + Alt + D         Forward delete full-word

# Which characters, besides letters and numbers, that are jumped over by a
# full-word jump:
FULLWORDCHARS="*?_-.,[]~=/&:;!#$%^(){}<>'\""

backward-full-word() { WORDCHARS=$FULLWORDCHARS zle .backward-word; }
backward-sub-word() { WORDCHARS="" zle .backward-word; }
forward-full-word() { WORDCHARS=$FULLWORDCHARS zle .forward-word; }
backward-kill-full-word() { WORDCHARS=$FULLWORDCHARS zle .backward-kill-word; }
backward-kill-sub-word() { WORDCHARS="" zle .backward-kill-word; }
forward-kill-full-word() { WORDCHARS=$FULLWORDCHARS zle .kill-word; }
forward-kill-sub-word() { WORDCHARS="" zle .kill-word; }

zle -N backward-full-word
zle -N backward-sub-word
zle -N forward-full-word
zle -N backward-kill-full-word
zle -N backward-kill-sub-word
zle -N forward-kill-full-word
zle -N forward-kill-sub-word

# For `forward-sub-word` we use the built-in `emacs-forward-word` widget,
# because that simulates bash behavior.
zle -A emacs-forward-word forward-sub-word

bindkey "^[b" backward-sub-word
bindkey "^[^b" backward-full-word
bindkey "^[f" forward-sub-word
bindkey "^[^f" forward-full-word
bindkey "^[^h" backward-kill-sub-word
bindkey "^w" backward-kill-full-word
bindkey "^[d" forward-kill-sub-word
bindkey "^[^d" forward-kill-full-word
