# Go to D partition disk, 'cause I save my work there
Clear-Host
Set-Location D:
# posh-git
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Custom-Theme

function Programming {
    Set-Location "D:/Files/Programming"
}
Set-Alias hack Programming

# Edit Powershell profile
function Themes {
    Set-Location "${$HOME}/Documents/WindowsPowerShell/Modules/oh-my-posh/2.0.492/Themes\"
}
Set-Alias themes Themes

# Edit the json which saves Windows Terminal configuration
function Edit-TerminalConfig {
    Set-Location "${$HOME}/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/"
    nvim settings.json
}
Set-Alias winterconfig Edit-TerminalConfig

# Edit my vimrc in this case the init.vim
function Edit-Vim {
    Set-Location $HOME/AppData/Local/nvim/
    nvim init.vim
}
Set-Alias vimconfig Edit-Vim

# Edit Powershell profile
function Edit-PsProfile {
    Set-Location $HOME/Documents/WindowsPowerShell
    nvim Microsoft.Powershell_profile.ps1
}
Set-Alias profile Edit-PsProfile

# A cat clone with wings.
Set-Alias cat bat -Option AllScope

# Exa, ls replacement
function Invoke-Exa {
    exa --icons
}
# Tree replacement
function Invoke-Tree {
    exa --icons -T
}

Set-Alias ls Invoke-Exa -Option AllScope
Set-Alias tree Invoke-Tree -Option AllScope

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
