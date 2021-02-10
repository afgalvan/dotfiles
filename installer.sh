#!/bin/bash

##? Setups the environment
##?
##? Usage:
##?    installer

errors=0
failed_installs=()

setup_colors() {
    if [ -t 1 ]; then
        YELLOW="\e[33m"
        BLUE="\e[34m"
        RED="\e[31m"
        GREEN="\e[32m"
        CYAN="\e[36m"
        BOLD="\e[1m"
        WHITE="\e[97m"
        RESET="\e[0m"
    fi
}

program_exists() {
    type "$1" >/dev/null 2>&1
}

print() {
    local color="$1"
    local text="$2"
    
    echo -e "$color$text$RESET"
}

installation_status() {
    local exit_code=$?
    local priority="$1" # 0. Indispensable, 1. Optional
    local program="$2"
    
    if [ $exit_code -ne 0 ]; then
        print "\n$RED" "ERROR: $program couldn't be installed."
        if [ $priority -ne 0 ]; then
            print "$YELLOW" "The dotfiles installation can continue anyway."
            failed_installs[("$errors")]="$program"
            errors=$(( errors + 1 ))
            sleep 0.5
        else
            print "$RED" "⛔️ The dotfiles installation CAN'T continue."
            exit 1
        fi
    fi
}

check_program() {
    local priority="$1" # 0. Indispensable, 1. Optional
    local program="$2"
    if [ -z "$3" ]; then
        local install_method="sudo $package_manager install $program"
    else
        local install_method="$3"
    fi
    
    echo -e "Checking for $WHITE$program$RESET"
    
    if ! program_exists "$program"; then
        if [ $priority == 0 ]; then
            print "\n$YELLOW" "WARN: $program its not installed."
        fi
        print "$CYAN" ">> Installing $BOLD$program...$RESET"
        $install_method
    else
        echo -e "$program$GREEN OK$RESET""."
    fi
    
    installation_status "$priority" "$program"
}

install_cargo() {
    check_program 1 "cargo" "curl -O https://raw.githubusercontent.com/rust-lang/rustup/master/rustup-init.sh"
    if [ -f "rustup-init.sh" ]; then
        bash rustup-init.sh --profile=default -y
        rm -f rustup-init.sh
    fi
    installation_status 1 "cargo"
}

install_dependencies() {
    # Primary programs
    # sudo apt update
    check_program 0 "git"
    check_program 0 "zsh"
    sudo chsh -s $(which zsh) || sudo chsh -s usr/bin/zsh
    check_program 0 "curl"
    install_cargo
    
    # Optional or secondary programs
    check_program 1 "screenfetch"
    check_program 1 "cmatrix"
    check_program 1 "htop"
    check_program 1 "nvim" "sudo apt install neovim"
    check_program 1 "tmux"
    if program_exists cargo; then
        # source $HOME/.cargo/env
        check_program 1 "exa" "cargo install exa"
        check_program 1 "bat" "cargo install bat"
    fi
    
    if [ $errors \> 1 ]; then
        local s="s"
    fi
    if [ $errors == 0 ]; then
        print "$GREEN" "✅️ All programs installed without errors!"
    else
        print "\n$YELLOW" "⚠️  $errors package$s couldn't be installed."
        print "$YELLOW" "And some features won't be available:"
        
        printf "• %s\n" "${failed_installs[@]}"
    fi
}

is_setted() {
    local package="$1"
    local path="$2"
    local set_method="$3"
    
    echo -e "Checking for $WHITE$package$RESET"
    if [ ! -d "$path" ]; then
        print "$CYAN" ">> Downloading $BOLD$package...$RESET"
        $set_method
        print "$CYAN" ">> $BOLD$package$RESET configured."
        return 1
    fi
    echo -e "$package$GREEN OK$RESET""."
    return 0
}

setup() {
    
    # Terminal theme and plugins
    is_setted "Oh-my-zsh" "$HOME/.oh-my-zsh" sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    is_setted "Powerlevel10k" "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    if [ -d ~/.p10k.zsh ]; then
        sudo rm -f ~/.p10k.zsh
    fi
    sudo cp .p10k.zsh ~/.p10k.zsh
    is_setted "Syntax Highlighting" "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" "sudo git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    is_setted "Autosuggestions" "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" "sudo git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
    
    # Tmux theme
    {
        is_setted "oh-my-tmux" "$HOME/.tmux" "sudo git clone https://github.com/gpakosz/.tmux.git ~/.tmux"
        } || {
        ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
        sudo cp .tmux.conf.local ~/.tmux.conf.local
    }
    
    print "$GREEN" "✅️ Everything setup!"
}

title_prompt() {
    local emoji="$1"
    local process="$2"
    
    printf "$emoji$BOLD$WHITE $process$RESET"
    sleep 0.3
    printf "."
    sleep 0.3
    printf "."
    sleep 0.3
    echo "."
    sleep 0.4
}

detect_package_manager() {
    if program_exists apt; then
        package_manager="apt"
        elif program_exists dnf; then
        package_manager="dnf"
    else
        print "$RED" "Platform not supported."
        exit 1
    fi
}

send_to_home() {
    file="$1"
    sudo cp -r "$file" "$HOME/$file"
}

main() {
    if [ "$1" == "-u" ] || [ "$1" == "--update" ]; then
        clear
        title_prompt "⬇️" "$BLUE Starting Update"
        # git pull origin main --ff-only
        send_to_home ".shell"
        send_to_home ".p10k.zsh"
        send_to_home ".tmux.conf.local"
        exit 0
    fi
    
    local dotfiles_prompt=$(less -FX img/dotfiles)
    
    clear
    setup_colors
    echo -e "$BLUE$dotfiles_prompt$RESET"
    title_prompt "🚀️" "Starting Installation"
    detect_package_manager
    install_dependencies
    echo ""
    title_prompt "📦️" "Starting Setup"
    setup
    print "\n$BOLD$BLUE" " ~ Try restarting your terminal to see the changes. ~"
}

main "$@"