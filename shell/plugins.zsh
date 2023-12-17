ZIM_HOME=${ZIM_HOME:-~/.cache/zim}
if [[ ! -d $ZIM_HOME ]]; then
  echo "zim plugin manager not installed, installing ..."
	curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
	rm ~/.zimrc
	ln -s ~/.config/zsh/zimrc ~/.zimrc
fi
