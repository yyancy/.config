if type -q mise
    mise activate fish | source
end

starship init fish | source
# enable TransientPrompt
enable_transience

zoxide init fish | source
atuin init fish | source
