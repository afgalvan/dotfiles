# Go to D partition disk, 'cause I save my work there
clear
cd D:
# posh-git
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Custom-Theme

# Edit the json which saves Windows Terminal configuration
function Terminal-Config {
    nvim "C:/Users/NANCIO GALVAN/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"
}
Set-Alias winterconfig Terminal-Config

# Edit my vimrc in this case the init.vim
function Edit-Vim {
    nvim "C:/Users/NANCIO GALVAN/AppData/Local/nvim/init.vim"
}
Set-Alias vimconfig Edit-Vim

# Temporally alias to go quickly to my Test script
function Goto-Parcial {
    cd "D:/Files/Programming/UPC/2nd_semester/Programming_I/3rd_cut/Exam"
}
Set-Alias parcial Goto-Parcial

# Temporally alias to edit quickly to my Test script
function Edit-Parcial {
    gotoParcial
    nvim parcial3.cpp
}
Set-Alias Eparcial Edit-Parcial

# Go to the UPC folder to make activities
function Goto-UPC {
    cd "D:/Files/Programming/UPC/C-lang"
}
Set-Alias UPC Goto-UPC

# Go to the Programming Folder
function Programming {
    cd "D:/Files/Programming"
}
Set-Alias hack Programming

# Edit Powershell profile
function Ps-Profile {nvim "C:/Users/NANCIO GALVAN/Documents/WindowsPowerShell/Microsoft.Powershell_profile.ps1"}
Set-Alias profile Ps-Profile

# oh-my-posh Themes folder
function Goto-Themes {
    cd "C:/Users/NANCIO GALVAN/Documents/WindowsPowerShell/Modules/oh-my-posh/2.0.487/Themes\"
}
Set-Alias themes Goto-Themes

# Take me to the vennom workspace
function Goto-Vennom {
    cd "D:/Files/Programming/Python/Vennom.py/Vennom/"
}
Set-Alias vennom Goto-Vennom

# A cat clone with wings.
Set-Alias cat bat -Option AllScope

#Save ls command in lsd
Set-Alias lsd dir

# Exa, ls replacement
function Invoke-Exa {
    & bash.exe -c "exa.exe --icons $args"
}
# Tree replacement
function Invoke-Tree {
    & bash.exe -c "exa.exe --icons -T"
}

Set-Alias ls Invoke-Exa -Option AllScope
Set-Alias tree Invoke-Tree -Option AllScope

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
