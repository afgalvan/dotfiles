export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Path
export PATH="$HOME/.local/bin/pyinstaller:$PATH"
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/.local/bin"
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/firefox/firefox:$PATH"
export FX11="~/javafx-sdk-11.0.2"
export FX15="~/javafx-sdk-15.0.1"
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}
export PATH="/home/linuxbrew/.linuxbrew/opt/python@3.8/bin:$PATH"

