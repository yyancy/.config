# nvim $PROFILE.CurrentUserCurrentHost
# . $env:USERPROFILE\.config\powershell\user_profile.ps1
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/avit.omp.json"| Invoke-Expression

$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

function Invoke-Starship-TransientFunction {
  &starship module character
}
Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

fnm env --use-on-cd | Out-String | Invoke-Expression

Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'


# function for alias
function get-git { git $args }
function get-gitstatus { git status }
function get-gitpull { git pull $args }
function get-gitcommit { git commit }
function get-gitcommitam { get-gitcommit -am $args }
function get-gitrestore { git restore }

Set-Alias -Name ll -Value ls
Set-Alias -Name l -Value ls

Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim

Set-Alias -Name lg -Value lazygit
Set-Alias -Name g -Value get-git
Set-Alias -Name gst -Value get-gitstatus
Set-Alias -Name gpl -Value get-gitpull
Set-Alias -Name gcc -Value get-gitcommit
Set-Alias -Name gcam -Value get-gitcommitam
Set-Alias -Name grs -Value get-gitrestore

Set-PSReadLineKeyHandler -Key 'Ctrl+e' `
        -BriefDescription "Go to EndOfLine or AcceptSuggestion" `
        -LongDescription `
            "If cursor is not at the end of line, then go to end of line, `
            otherwise try to AcceptSuggestion" `
        -ScriptBlock {
    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
    if ($cursor -ne $line.Length) {
        [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
    } else {
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptSuggestion()
    }
}


# starship enable transient prompt
Enable-TransientPrompt
