# Shell functions. Mirrors the portable helpers in shell/zsh/helper.zsh.
# `yy` lives in fish/functions/yy.fish (autoloaded), so it is not repeated here.

# create directory (and parents) then enter it
function mkc --description 'mkdir -p and cd into it'
    mkdir -pv $argv[1]; and cd $argv[1]
end

# view a command's --help in a pager
function hp --description 'page a command help output'
    $argv[1] --help | less --incsearch --ignore-case
end

# xdg-open detached from the terminal
function o --description 'open a file with the default application'
    xdg-open $argv &>/dev/null &
end

# print the first version string a command responds to
function vv --description 'print a command version'
    for p in --version -version version -v
        if set -l output ($argv[1] $p 2>&1)
            echo $output
            return 0
        end
    end
    return 1
end

# resolve a command through symlinks, then print its version
function typeof --description 'resolve a command path and show its version'
    set -l cmd (command -v $argv[1]); or return 1
    echo $cmd
    set -l resolved (realpath $cmd 2>/dev/null)
    test -n "$resolved" -a "$resolved" != "$cmd"; and echo $resolved
    vv $cmd
end

function mydiff --description 'unified diff through diff-so-fancy'
    diff -u $argv | diff-so-fancy
end

# rsync copy / move with progress
function cpr --description 'rsync copy with progress'
    rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 $argv
end

function mvr --description 'rsync move with progress'
    rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 \
        --remove-source-files $argv
end

# ripgrep + fzf: find files containing a string, preview matches in context
function fif --description 'search file contents and preview with fzf'
    if test (count $argv) -eq 0
        echo "Need a string to search for!" >&2
        return 1
    end
    rg --files-with-matches --no-messages $argv[1] \
        | fzf --preview "rg --ignore-case --pretty --context 10 '$argv[1]' {}"
end
