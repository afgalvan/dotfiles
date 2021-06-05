#!/bin/bash

program_exists() {
    type "$1" >/dev/null 2>&1
}

# Aliases
alias vim='nvim'
alias vimconfig='cd ~/.config/nvim; nvim init.vim'
alias zshconfig='nvim ~/.zshrc'
alias tmuxconfig='nvim ~/.tmux.conf.local'
alias p10kconfig='nvim ~/.p10k.zsh'
alias college='cd ~/Documents/College'
alias hack='cd ~/Documents/Programming'
if program_exists "exa"; then
    alias ls='exa --icons'
    alias tree='exa --icons -T'
fi
if program_exists "bat"; then
    alias cat='bat'
fi
if program_exists "trash"; then
    alias rm='trash'
fi
alias zupdate='sudo apt update'
alias xupgrade='sudo apt upgrade'
alias cmatrix='cmatrix -C red -s -u 9'
alias create-app="~/.config/create-app/create_app.sh"
alias javafx="~/.scripts/javafx.sh"
alias screen='~/screen'
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias prp='pipenv run python3'

# WSL only aliases
if [[ $(grep Microsoft /proc/version) ]]; then
    alias files='cd /mnt/d/Files'
    alias hack='cd /mnt/d/Files/Programming'
    alias powershell='powershell.exe'
    alias python='python.exe'
    alias winterconfig='nvim /mnt/c/Users/Galvan/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json'
    export dotpath="/mnt/d/Files/Programming/dotfiles"
    # copy on WSL
    alias copy="clip.exe"
    alias paste="powershell.exe Get-Clipboard"
else
    # copy on linux
    alias copy="xclip -sel clip"
    alias paste="xclip -sel clip -o"
fi

alias dotfiles="bash $dotpath/installer.sh"
alias dotfiles_sync="sudo cp ~/.zshrc $dotpath; sudo cp -r ~/.shell $dotpath; sudo cp ~/.p10k.zsh $dotpath; sudo cp ~/.tmux.conf.local $dotpath; sudo rsync -av --progress ~/.config/nvim/*  \"$dotpath/.config/nvim\" --exclude=plugged --exclude=pack"
alias dotsync="rm -rf ~/.zshrc ~/.p10k.zsh; ln -s $dotpath/.p10k.zsh  $HOME/.p10k.zsh; ln -s $dotpath/.zshrc $HOME/.zshrc"
alias di="docker images"
alias compose="docker-compose"
alias please="sudo"
alias thanks="exit"
alias gradlew="./gradlew"
alias project="college; cd programmingII/FinalProject"
alias rofi="~/.config/rofi/launchers/colorful/launcher.sh"
alias rrofi="rofi -show run -i -show-icons"
alias drofi="rofi -modi drun -show drun -i -show-icons"
