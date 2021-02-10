#!/bin/bash

compilejava() {
    local file_name="$1"
    local class_name=$(echo $file_name | cut -d '.' -f 1)
    
    mkdir -p "../out/production/$1/"
    javac "$file_name"
    mv "$class_name" "../out/production/$class_name/"
}

runjava() {
    local file_name="$1"
    local class_name=$(echo $file_name | cut -d '.' -f 1)
    
    cd "../out/production/$class_name/"
    java "$class_name"
}

jrun() {
    local file_name="$1"
    local class_name=$(echo $file_name | cut -d '.' -f 1)
    
    javac "$file_name"
    java "$class_name"
}

g__run() {
    local compiler="$1"
    local file_name="$2"
    local out_name=$(echo $file_name | cut -d '.' -f 1)
    
    {
        $compiler "$file_name" -o "$out_name.out"
        } && {
        ./"$out_name.out"
        } || {
        echo ""
    }
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

function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$* ;}
