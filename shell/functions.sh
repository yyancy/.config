

function mydiff() {
  diff -u $@ | diff-so-fancy
}

function hh () {
  "$1" --help
}
