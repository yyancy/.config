# .config

## install
```bash
git init
git remote add origin git@github.com:yyancy/.config.git
git pull origin master

ln -sv ~/.config/zsh/zprofile ~/.zprofile
```

## Initialize a new environment

```bash
curl -fsSL https://gitee.com/yyancyer/config/raw/master/init_basic_dev_env.sh -o init_basic.sh
bash init_basic.sh
```

## install tmux and plugins

As of tmux3.1, the configuration location of tmux is in `.config/tmux/tmux.conf`
first, install tmux version above 3.1.

```bash
wget https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz
tar xvf tmux-VERSION.tar.gz
./configure && make
sudo make install

```

### install tpm

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

later, using `C-a I` to install plugins

### Tmux tips

```bash
# prefix l go to previous window
# prefix ; go to previous pane
# A-S-c reload config
bind l last-window
```

### Mint disable Alt-` keybinding
gsettings list-recursively | grep Above_Tab

dconf-editor
https://superuser.com/questions/1338522/disable-alt-keyboard-shortcut-in-linux


### zsh change cursor shape

add the following code to the start of .zshrc file.
```zsh
>$TTY echo -ne '\e[5 q' # Use beam shape cursor on startup.

export KEYTIMEOUT=1
# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    # zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
```


## install homebrew

### install dependancies

sudo apt-get install build-essential procps curl file git

### install script

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### Git tips

1. remove files from git but leave it in directory
   git rm --cached FILENAME

2. unstaged a staged changes (git add changes)
   git reset HEAD FILENAME
   git restore --staged FILENAME
3. remove current changes
   git restore FILENAME

4. undo last commit
   git reset --soft HEAD~1

## other programs

- exa
- duf


## Fcitx configuration references
- https://github.com/xieyuheng/conf/blob/master/fcitx.org 

## fix keybinding issues 
- https://askubuntu.com/questions/68463/how-to-disable-global-super-p-shortcut


## TODOs
- try fzf jump feature: https://github.com/junegunn/fzf/issues/3637
