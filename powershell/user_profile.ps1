# nvim $PROFILE.CurrentUserCurrentHost
# . $env:USERPROFILE\.config\powershell\user_profile.ps1

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/avit.omp.json"| Invoke-Expression

fnm env --use-on-cd | Out-String | Invoke-Expression
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# For zoxide v0.8.0+
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})

$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding
# $OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = [System.Text.Encoding]::GetEncoding(936);


# function for alias

function get-git { git }
function get-gitstatus { git status }
function get-gitpull { git pull }
function get-gitcommit { git commit }
function get-gitcommitam { get-gitcommit -am }
function get-gitrestore { git restore }

Set-Alias -Name ll -Value ls
Set-Alias -Name l -Value ls

Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim


Set-Alias -Name g -Value get-git
Set-Alias -Name gst -Value get-gitstatus
Set-Alias -Name gpp -Value get-gitpull
Set-Alias -Name gcc -Value get-gitcommit
Set-Alias -Name gcam -Value get-gitcommitam
Set-Alias -Name grs -Value get-gitrestore


