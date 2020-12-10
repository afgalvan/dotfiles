if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/andres/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
HIST_STAMPS="dd/mm/yyyy"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	python
	pip
	node
	docker
)

source $ZSH/oh-my-zsh.sh

# User configuration
# export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
ccompile() {
  gcc "$1.c" -o "$1" 
}
compile++() {
  g++ "$1.cpp" -o "$1"
}

# Example aliases
alias zshconfig='nvim ~/.zshrc'
alias vimconfig='cd ~/.config/nvim; nvim init.vim'
alias tmuxconfig='nvim ~/.tmux.conf.local'
alias hack='cd /mnt/d/Files/Programming'
alias goUPC='hack; cd UPC/2nd_semester/Programming_I/3rd_cut'
alias parcial='goUPC; cd Exam'
alias Eparcial='goUPC; cd Exam; nvim parcial3.cpp'
alias files='cd /mnt/d/Files'
alias javier='echo \"No me digas ese nombre ve, puro pelao mk\"'
alias andres='echo \"Haz mencionado a mi Dios pichón 🍆\"'
alias ls='exa --icons'
alias tree='exa --icons -T'
alias cat='bat'
alias p10kconf='nvim ~/.p10k.zsh'
alias zupdate='sudo apt update'
alias xupgrade='sudo apt upgrade'
alias dotfiles='sudo cp ~/.zshrc /mnt/d/Files/Programming/dotfiles/; sudo rsync -av --progress ~/.config/nvim/*  . /mnt/d/Files/Programming/dotfiles/.config/nvim --exclude plugged'
alias vennom='cd /mnt/d/Files/Programming/Python/Vennom.py/Vennom; nvim'
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim='nvim'
# Windows Aliases
alias powershell="powershell.exe"
alias python='python.exe'
alias winterconfig='nvim /mnt/c/Users/Galvan/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json'

export TERM=screen-256color

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# To customize prompt, run `p9k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
export DENO_INSTALL="/home/andres/.deno"
export PATH="$DENO_INSTALL/bin/:$PATH"
export PATH="/home/andres/.local/bin:$PATH"

# Copy to clipboard in WSL
if grep -q -i microsoft /proc/version; then
    # on WSL
    alias copy="clip.exe"
    alias paste="powershell.exe Get-Clipboard"
else
    # on "normal" linux
    alias copy="xclip -sel clip"
    alias paste="xclip -sel clip -o"
fi
