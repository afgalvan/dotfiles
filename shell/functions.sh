#!/bin/bash
export YELLOW="\e[33m"
export BLUE="\e[34m"
export RED="\e[31m"
export GREEN="\e[32m"
export CYAN="\e[36m"
export BOLD="\e[1m"
export WHITE="\e[97m"
export RESET="\e[0m"

rank() {
    local page="$1"
    local rows="$2"
    echo $((50 * ($page - 1) + $rows))
}

aj-set() {
    local current_challenge="$1"
    echo "$current_challenge" > ~/.ajrc
}

aj-go() {
    local current_challenge=$( tail -n 1 ~/.ajrc )
    aj && cd "code/codeabbey/$current_challenge"
}

out-new() {
    /mnt/g/Documents/Programming/Projects/bash/dotfiles/shell/out_new.py $@
}

re() {
    local file_name="$1"
    local executable_name=$(echo $file_name | cut -d '.' -f 1)
    ocamlc -o "$executable_name" -pp "refmt -p ml" -impl "$file_name" && ./"$executable_name"
}

gpl() {
    local file_name="$1"
    local executable_name=$(echo $file_name | cut -d '.' -f 1)
    gplc "$file_name" && ./"$executable_name"
}

fort() {
    local files=("$@")
    local executable="${files[-1]}"
    local executable_name=$(echo $executable | cut -d '.' -f 1)
    gfortran "${files[@]}" -o "$executable_name.o" && ./"$executable_name.o"
}

compilejava() {
    local file_name="$1"
    local class_name=$(echo $file_name | cut -d '.' -f 1)

    mkdir -p "../out/production/$1/"
    javac "$file_name"
    mv "$class_name" "../out/production/$class_name/"
}

runjava() {
    local file_name="$1"
    local class_name=$(echo $vim-plugfile_name | cut -d '.' -f 1)

    cd "../out/production/$class_name/"
    java "$class_name"
}

jrun() {
    local file_name="$1"
    local class_name=$(echo $file_name | cut -d '.' -f 1)

    javac "$file_name"
    java "$class_name"
}

peek() {
    local folder="$1"

    cd "$folder"
    echo $(pwd)"/"$(exa | fzf)
    local tmp=$(cd -)
}

migrate() {
    local file_name="$1"
    local new_extension="$2"

    local file_without_extension=$(echo $file_name | cut -d '.' -f 1)
    mv "$file_name" "$file_without_extension.$new_extension"
}

java-txt() {
    local root="$1"

    for file in $(find "$root"/* | grep .java);do
        migrate $file "txt"
    done
}

g__run() {
    local compiler="$1"
    local file_name="$2"
    local out_name=$(echo $file_name | cut -d '.' -f 1)

    $compiler "$file_name" -o "$out_name.out" && ./"$out_name.out"
}

crun() {
    g__run "gcc" "$1"
}

cpprun() {
    g__run "g++" "$1"
}

conanbuild() {
    rm -rf build
    mkdir build
    pushd build
    conan install ..
    cmake .. -DCMAKE_BUILD_TYPE=Release
    cmake --build .
}

conanrun() {
    cbuild "$1"
    bin/"$1"
    cd -
}

localhost(){
    local port="$1"
    xdg-open "http://localhost:$port"
}

docker-run() {
    local image_tag="$1"
    local runner_name="$1-runner"

    echo -e "$BLUE" "  Building $image_tag...$RESET"
    sleep 0.1
    docker build -t "$image_tag" .
    docker run -it --rm --name "$runner_name" "$image_tag"
}

extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar -jxvf $1                        ;;
            *.tar.gz)   tar -zxvf $1                        ;;
            *.bz2)      bunzip2 $1                          ;;
            *.gz)       gunzip $1                           ;;
            *.tar)      tar -xvf $1                         ;;
            *.tbz2)     tar -jxvf $1                        ;;
            *.tgz)      tar -zxvf $1                        ;;
            *.zip)      unzip $1                            ;;
            *.ZIP)      unzip $1                            ;;
            *.pax)      cat $1 | pax -r                     ;;
            *.pax.Z)    uncompress $1 --stdout | pax -r     ;;
            *.rar)      unrar x $1                          ;;
            *.Z)        uncompress $1                       ;;
            *)          echo "\"$1\" cannot be extracted/mounted via extract()" ;;
        esac
    else
        echo "\"$1\" is not a valid file"
    fi
}

DOCKER_DISTRO="Ubuntu"
DOCKER_DIR=/mnt/wsl/shared-docker
DOCKER_SOCK="$DOCKER_DIR/docker.sock"
export DOCKER_HOST="unix://$DOCKER_SOCK"

docker-start() {
    if [ ! -S "$DOCKER_SOCK" ]; then
        mkdir -pm o=,ug=rwx "$DOCKER_DIR"
        chgrp docker "$DOCKER_DIR"
        /mnt/c/Windows/System32/wsl.exe -d $DOCKER_DISTRO sh -c "nohup sudo -b dockerd < /dev/null > $DOCKER_DIR/dockerd.log 2>&1"
    fi
}

docker-service() {
    local docker_version=$(docker --version | grep -o -E "([0-9]*\.[0-9])+" | head -1)

    if [[ "$1" == "status" ]]; then
        if [[ $DOCKER_ON == 1 ]]; then
            echo "\e[92m \e[97m Containers running.\e[0m"
        else
            echo "\e[31m \e[90m Containers off.\e[0m"
        fi
    elif [[ "$1" == "kill" ]]; then
        if [[ $DOCKER_ON == 0 ]]; then
            echo -e "\e[31mERROR: \e[0mNo Docker instance it's running."
            return 1
        fi
        DOCKER_ON=0
        echo "  Destroying node..."
        echo "  Destroying container..."
        echo "\e[31m \e[0m Docker instance stopped."
    else
        if [[ $DOCKER_ON == 1 ]]; then
            echo "A Docker instance it's already running."
            return 0
        fi
        echo "Starting local Docker v$docker_version container..."
        docker-start

        echo -e "Docker instance is now configured to be used.\n"
        echo "Share images, automate workflows, and more with a free Docker ID:"
        echo " https://hub.docker.com/"
        DOCKER_ON=1
    fi
}

function add-alias() {
    echo "alias $1=\"$2\"" >> $HOME/.shell/aliases.sh
}

function mkcd() {
    mkdir "$1"
    cd "$1"
}

function mvc() {
    local package="$1"
    mkcd "$package"
    mkdir models
    mkdir views
    mkdir controllers
    mkdir main
    cd -
}

function ddd() {
    local package="$1"
    mkcd "$package"
    mkdir Domain Infrastructure Application
    cd -
}

function college() {
    local subject="$1"

    local target="$HOME/Documents/College/subjects"
    cd "$target"
    [[ ! -z "$subject" ]] && cd "$subject" || ls
}

function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$* ;}
