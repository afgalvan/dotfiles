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
sudo apt install make
make install