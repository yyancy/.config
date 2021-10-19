

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
