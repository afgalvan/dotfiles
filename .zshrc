if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

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
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi
# export ARCHFLAGS="-arch x86_64"

export TERM=screen-256color
source "$HOME/zsh/.functions"
source "$HOME/zsh/.aliases"
source "$HOME/zsh/.zshenv"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/andres/.sdkman"
[[ -s "/home/andres/.sdkman/bin/sdkman-init.sh" ]] && source "/home/andres/.sdkman/bin/sdkman-init.sh"
