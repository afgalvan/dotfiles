#!/bin/bash

# Aliases
alias vim='nvim'
alias vimconfig='cd ~/.config/nvim; nvim init.vim'
alias zshconfig='nvim ~/.zshrc'
alias tmuxconfig='nvim ~/.tmux.conf.local'
alias p10kconfig='nvim ~/.p10k.zsh'
alias college='cd ~/Documents/College'
alias hack='cd ~/Documents/Programming'
if ! [ -x "$(command -v exa)" ]; then
    alias ls='exa --icons'
    alias tree='exa --icons -T'
fi
if ! [ -x "$(command -v bat)" ]; then
    alias cat='bat'
fi
alias zupdate='sudo apt update'
alias xupgrade='sudo apt upgrade'
alias cmatrix='cmatrix -C red -s -u 9'
alias create-app="~/.config/create-app/create_app.sh"
alias javafx="~/.scripts/javafx.sh"
alias screen='~/screen'
export dotfiles_repo="$HOME/Documents/Programming/dotfiles"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias prp='pipenv run python3'

# WSL only aliases
if [[ $(grep Microsoft /proc/version) ]]; then
    alias files='cd /mnt/d/Files'
    alias hack='cd /mnt/d/Files/Programming'
    alias powershell='powershell.exe'
    alias python='python.exe'
    alias winterconfig='nvim /mnt/c/Users/Galvan/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json'
    export dotfiles_repo="/mnt/d/Files/Programming/dotfiles"
    # copy on WSL
    alias copy="clip.exe"
    alias paste="powershell.exe Get-Clipboard"
else
    # copy on linux
    alias copy="xclip -sel clip"
    alias paste="xclip -sel clip -o"
fi

alias dotfiles="sudo cp ~/.zshrc $dotfiles_repo; sudo cp -r ~/.zsh $dotfiles_repo; sudo cp ~/.p10k.zsh $dotfiles_repo; sudo cp ~/.tmux.conf.local $dotfiles_repo; sudo rsync -av --progress ~/.config/nvim/*  \"$dotfiles_repo/.config/nvim\" --exclude=plugged --exclude=pack"
