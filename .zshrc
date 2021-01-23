if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/andres/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
CASE_SENSITIVE="true"
DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  python
  pip
  docker
  node
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

compilejava() {
  # rm -rf ../out
  mkdir -p "../out/production/$1/";
  javac "$1.java";
  mv "$1.class" "../out/production/$1/";
}

runjava() {
  cd "../out/production/$1/";
  java "$1";
  cd -;
}

cbuild() {
  rm -rf build
  mkdir build
  pushd build
  conan install ..
  cmake .. -DCMAKE_BUILD_TYPE=Release
  cmake --build .
}

crun() {
  cbuild "$1"
  bin/"$1"
  cd -
}

# Aliases
alias vim='nvim'
alias vimconfig='cd ~/.config/nvim; nvim init.vim'
alias zshconfig='nvim ~/.zshrc'
alias tmuxconfig='nvim ~/.tmux.conf.local'
alias p10kconfig='nvim ~/.p10k.zsh'
alias hack='cd ~/Documents/Programming'
alias ls='exa --icons'
alias cat='bat'
alias tree='exa --icons -T'
alias zupdate='sudo apt update'
alias xupgrade='sudo apt upgrade'
alias cmatrix='cmatrix -C red -s -u 9'
alias create-app="~/.config/create-app/create_app.sh"
alias screen='~/screen'
dotfiles_repo='/home/andres/Documents/Programming/dotfiles'
# alias ohmyzsh="mate ~/.oh-my-zsh"

# WSL only aliases
if [[ $(grep Microsoft /proc/version) ]]; then
  alias files='cd /mnt/d/Files'
  alias hack='cd /mnt/d/Files/Programming'
  alias powershell='powershell.exe'
  alias python='python.exe'
  alias winterconfig='nvim /mnt/c/Users/Galvan/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json'
  dotfiles_repo="/mnt/d/Files/Programming/dotfiles"
  # copy on WSL
  alias copy="clip.exe"
  alias paste="powershell.exe Get-Clipboard"
else
  # copy on linux
  alias copy="xclip -sel clip"
  alias paste="xclip -sel clip -o"
fi
alias dotfiles="sudo cp ~/.zshrc $dotfiles_repo; sudo cp ~/.p10k.zsh $dotfiles_repo; sudo rsync -av --progress ~/.config/nvim/*  $dotfiles_repo/.config/nvim --exclude plugged"

export TERM=screen-256color
export MYSQL_PSS='admin'
export CRYPTO_KEY='E4v6chThwBus0YJi_4DMjFeUOX-EzwfW5WHf6OBm45s='

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Path
export PATH="/home/andres/.local/bin/pyinstaller:$PATH"
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/home/andres/.local/bin"
export DENO_INSTALL="/home/andres/.deno"
export PATH="$DENO_INSTALL/bin/:$PATH"
export PATH="/home/andres/.local/bin:$PATH"
