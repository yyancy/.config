bass 'pathprepend() { PATH="${1}${PATH:+:${PATH}}"; export PATH; }; source ~/.config/shell/env.sh'

if test -f ~/.secrets/env.fish
    source ~/.secrets/env.fish
end
