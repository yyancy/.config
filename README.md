# .config


## install 
``` bash
git init
git remote add origin git@github.com:yyancy/.config.git
git pull origin master

# installing zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# installing zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# installing zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# editing zshrc file
source ~/.config/zsh-config.zsh

source $ZSH/oh-my-zsh.sh

source ~/.config/profile.sh

# at the end of zshrc file
## autujump setup configuration
[[ -s /home/yancy/.autojump/etc/profile.d/autojump.sh ]] && source /home/yancy/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

```

## Initialize a new environment
``` bash
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

## install homebrew
### install dependancies
sudo apt-get install build-essential procps curl file git
### install script
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## other programs
* exa
* duf
