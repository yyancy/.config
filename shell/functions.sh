

function mydiff() {
  diff -u $@ | diff-so-fancy
}

function hh () {
  "$1" --help
}


function vv () {
  "$1" --version
}
