#!/usr/bin/env bash

# 初始化最基本的开发环境. 
# 设置vim 和 tmux
vim_template="https://gitee.com/yyancyer/nvim/raw/lua/vimrc.local"
tmux_template="https://gitee.com/yyancyer/config/raw/master/tmux/tmux.template"
vim_conf_path="$HOME/.vim"
tmux_conf_path="$HOME/.tmux"

if ! which vim ; then
  echo "ERROR: cannot find vim. please install first." >&2
  exit 1
fi

if [[ ! -d ${vim_conf_path} ]]; then
  mkdir -v "${vim_conf_path}"
fi

if [[ -f "${vim_conf_path}/vimrc" ]]; then
  echo "vimrc has already exists. rename it to vimrc.old."
  mv -v "${vim_conf_path}/vimrc" "${vim_conf_path}/vimrc.old"
fi

curl ${vim_template} -o "${vim_conf_path}/vimrc"
git clone https://gitee.com/yyancyer/vim-tmux-navigator.git \
  ${vim_conf_path}/pack/plugins/start/vim-tmux-navigator


# install tmux configuration
if ! which tmux ; then
  echo "ERROR: cannot find tmux. please install first." >&2
  exit 1
fi

if [[ ! -d ${tmux_conf_path} ]]; then
  mkdir -v "${tmux_conf_path}"
fi

curl ${tmux_template} -o "$HOME/.tmux.conf"
git clone https://gitee.com/yyancyer/tpm.git ${tmux_conf_path}/plugins/tpm
