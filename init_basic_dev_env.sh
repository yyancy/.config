#!/usr/bin/env bash

# 初始化最基本的开发环境. 
# 设置vim 和 tmux
vim_template="https://gitee.com/yyancyer/nvim/raw/lua-lazy/vimrc.local"
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

grep -q -i 'centos' /etc/os-release
is_centos=$?

# install tmux configuration
if [ $is_centos -ne 0 ] && ! which tmux ; then
  echo "ERROR: cannot find tmux. please install first." >&2
  exit 1
fi

if [ $is_centos -eq 0 ] ; then
  echo "INFO: use tmux-3.0a AppImage..."
  app_name=tmux-3.0a.AppImage
  curl -fsSL https://gitee.com/yyancyer/config/raw/master/tmux-3.0a-x86_64.AppImage -o /tmp/$app_name
  sudo mv -vf /tmp/$app_name /usr/local/bin
  sudo chmod +x /usr/local/bin/$app_name
  if command -v /usr/local/bin/tmux &> /dev/null ; then
     echo "backup previous tmux"
     sudo mv -vf /usr/local/bin/tmux /usr/local/bin/tmux.old
  fi
  ln -sv /usr/local/bin/$app_name /usr/local/bin/tmux
fi




if [[ ! -d ${tmux_conf_path} ]]; then
  mkdir -v "${tmux_conf_path}"
fi

curl ${tmux_template} -o "$HOME/.tmux.conf"
git clone https://gitee.com/yyancyer/tpm.git ${tmux_conf_path}/plugins/tpm
