# Personal Linux development configurations

## NOTES

1. RULE NO.1 DO NOT USE SYSTEM python!!!! Use yourself.

## TODOs

- update system `apt update && apt upgrade` and change china software mirrors
- sogou input method (only sogoupinyin_4.0.1.2800_x86_64.deb work!!!)
- keyd service (for caps and esc remapping)
- font code (Fira code)
- ulauncher
- install `Source Han Sans CN` font

## Prerequisite

### update system `apt update && apt upgrade` and change china software mirrors

### add some variable to /etc/environment

```shell
ZDOTDIR="/home/yancy/.config/zsh"
```

### Install some basic packages

```shell

sudo apt-get install build-essential git-all \
  xclip \
  fonts-firacode \
  flameshot \
  plank \
  tmux \
  zsh \
```

#### change shell to zsh

#### Install linuxbrew

```bash

/bin/bash -c "$(curl -fsSL <https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh>)"

# package installed by brew

brew install fd ripgrep git-delta fzf eza \
  bat atuin mise \
  zoxide lazygit yazi


```

- wezterm

### shell Configuration

#### Tmux Configuration

```bash
# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

#### Keyd Configuration

```bash

# Install keyd
git clone <https://github.com/rvaiya/keyd> && cd keyd && make && sudo make install
sudo ln -s ~/.config/keyd/default.conf /etc/keyd/default.conf
sudo systemctl enable keyd && sudo systemctl start keyd

```

## Optionals

- change nvidia driver

## notes

packages:

- bitwarden
- ulanucher

apt installs:

- set clash port to 7890
- zprofile to ~/.zprofile

### sudo use http_proxy env

sudo update-alternatives --config editor
sudo visudo
Defaults        env_keep+="http_proxy ftp_proxy all_proxy https_proxy no_proxy" # Add this line

### TDDOs

- copy sogoupinyin and fcitx config from laptop
- beautify mint using youtube 😊

- maybe refactor zsh config
- learn neotree.nvim
- find a way to search all files in neovim C-i key
- remap Alt+\` key, very smooth~ very happy 😊
