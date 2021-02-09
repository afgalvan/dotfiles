#!/bin/bash
clear
less -FX installers/msg.txt
cat << "LINUX"


                 a8888b.
                d888888b.
                8P"YP"Y88
                8|o||o|88
                8'    .88
                8`._.' Y8.
               d/      `8b.
              dP   .    Y8b.
             d8:'  "  `::88b
            d8"         'Y88b
           :8P    '      :888
            8a.   :     _a88P
          ._/"Yaa_:   .| 88P|
          \    YP"    `| 8P  `.
          /     \.___.d|    .'
          `--..__)8888P`._.'



LINUX

printf "Starting Installation"
sleep 0.4
printf "."
sleep 0.4
printf "."
sleep 0.4
echo "."
sleep 0.4
sudo apt update
sudo apt upgrade
if ! [ -x "$(command -v make)" ]; then
    sudo apt install make
fi
if ! [ -x "$(command -v zsh)" ]; then
    sudo apt install zsh
fi
sudo chsh -s $(which zsh) || sudo chsh -s usr/bin/zsh
sudo apt-get install curl
curl -O https://raw.githubusercontent.com/rust-lang/rustup/master/rustup-init.sh && bash rustup-init.sh --profile=default -y
source $HOME/.cargo/env
make install
