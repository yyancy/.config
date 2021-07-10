# source aliases file
DT_HOME="$HOME/.config/shell"
if [ -f "$DT_HOME/aliases.sh" ]; then 
	. $DT_HOME/aliases
fi

# source functions file

if [ -f "$DT_HOME/functions.sh" ]; then 
	. $DT_HOME/functions
fi



[ -x "$(command -v thefuck)" ] && eval $(thefuck --alias)


# add path
PATH="/usr/local/mysql/bin:$PATH"
PATH="$HOME/.jdks/jdk/bin:$PATH"
PATH="$PATH:/opt/maven/bin"


# remove duplicate items
export PATH=`echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}'`
export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/bin"




