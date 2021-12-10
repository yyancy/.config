# Functions to help us manage paths.  Second argument is the name of the
# path variable to be modified (default: PATH)
function pathremove () {
        local IFS=':'
        local NEWPATH
        local DIR
        local PATHVARIABLE=${2:-PATH}
        for DIR in ${!PATHVARIABLE} ; do
                if [ "$DIR" != "$1" ] ; then
                  NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
                fi
        done
        export $PATHVARIABLE="$NEWPATH"
}

function pathprepend () {
        pathremove $1 $2
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
}

function pathappend () {
        pathremove $1 $2
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
}

export -f pathremove pathprepend pathappend

function mydiff() {
  diff -u $@ | diff-so-fancy
}

function hh () {
  "$1" --help
}


function vv () {
  params=("--version" "-version" "version")
  for p in "${params[@]}" ; do
    output="$($1 $p 2>&1)"
    if [ "$?" -eq "0" ]; then
      echo $output
      break
    fi
  done

}
