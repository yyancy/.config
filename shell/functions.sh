# Functions to help us manage paths.  Second argument is the name of the
# path variable to be modified (default: PATH)

# set spliting words automatically
if [ "$ZSH_VERSION" ]; then
  setopt sh_word_split
fi

function pathremove () {
  local IFS=':'
  local NEWPATH
  local DIR
  local PATHVARIABLE=${2:-PATH}
  for DIR in ${(P)PATHVARIABLE} ; do
    if [ "$DIR" != "$1" ] ; then
      NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
    fi
  done
  export $PATHVARIABLE="$NEWPATH"
}

function pathprepend () {
  pathremove $1 $2
  local PATHVARIABLE=${2:-PATH}
  export $PATHVARIABLE="$1${(P)PATHVARIABLE:+:${(P)PATHVARIABLE}}"
}

function pathappend () {
  pathremove $1 $2
  local PATHVARIABLE=${2:-PATH}
  export $PATHVARIABLE="${(P)PATHVARIABLE:+${(P)PATHVARIABLE}:}$1"
}
# determine whether given command exists
function has(){
	command -v $@ &>/dev/null
}

function mydiff() {
  diff -u $@ | diff-so-fancy
}

function hp () {
  "$1" --help | less --incsearch --ignore-case
}

# create directory and enter it
function mkc () {
  mkdir -pv "$@" && cd "$_"
}

function vv () {
  params=("--version" "-version" "version" "-v")
  for p in "${params[@]}" ; do
    output="$($1 $p 2>&1)"
    if [ "$?" -eq "0" ]; then
      echo $output
      break
    fi
  done

}

function o() {
  xdg-open "$@" &> /dev/null
}

function type() {
  CMD="$(command -v "$@")"
  echo "$CMD"
  while [[ -L "$CMD" ]]; do
    CMD="$(readlink "$CMD")"
    CMD="$(command -v "$CMD")"
    echo "$CMD"
  done
  vv "$CMD"
}

# apt wrapper function
function a() {
  NAME="$0"
  USAGE="usage: $NAME [install | update | remove] {package}"
  if [ $# -eq 0 ]; then
    echo $UESGE
    return 1
  fi
  if [ "$1" != "" ]; then
    case $1 in
      install|update|remove )
        CMD="$1"
        if [ "$2" = "" ]; then
          echo "must supply a package"
          echo -e "$NAME install ${Red}package"
          return 1
        fi
        shift
        ACTION=$CMD
        if [ "$CMD" = "update" ]; then
          ACTION="install --only-upgrade"
        fi
        eval "sudo apt $ACTION $*"
        ;;
      -h|help|*)
        echo $USAGE
        ;;
    esac
  fi
}

function af() {
  alias-finder -l "$@"
}

function cpr() {
  rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 "$@"
}
function mvr() {
  rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-files "$@"
}
