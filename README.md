# .config

## install

```bash
git init
git remote add origin git@github.com:yyancy/.config.git
git pull origin master

ln -sv ~/.config/zsh/zprofile ~/.zprofile
```

### install tpm

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

later, using `C-a I` to install plugins

### Tmux tips

```bash
 prefix l go to previous window
 prefix ; go to previous pane
 A-S-c reload config
 prefix !  create a new window from a pane
 prefix z  maximux the pane
 prefix s show all sessions
 prefix ( previous session
 prefix ) next session
 prefix . move window from one session to another
 prefix + [ enter vi mode
```

## install homebrew

```bash
sudo apt-get install build-essential procps curl file git
### install script
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

```

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

## Fcitx configuration references

- <https://github.com/xieyuheng/conf/blob/master/fcitx.org>

## fix keybinding issues

- <https://askubuntu.com/questions/68463/how-to-disable-global-super-p-shortcut>

### Mint disable Alt-` keybinding

gsettings list-recursively | grep Above_Tab

### Mint disable Alt-click move windows

update System settings - Windows - Click actions -> Window Action key
<https://www.reddit.com/r/linuxmint/comments/18wlx8i/disabling_alt_click_hotkey/>

dconf-editor
<https://superuser.com/questions/1338522/disable-alt-keyboard-shortcut-in-linux>

## TODOs

- try fzf jump feature: <https://github.com/junegunn/fzf/issues/3637>
