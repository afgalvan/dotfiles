#!/bin/bash

javafx() {
    local command="$1"
    local target="$2"
    
    if [ -z "$3" ]; then
        local javafx_version="11.0.2"
    else
        local javafx_version="$3"
    fi
    
    $command --module-path "$JAVAFX_PATH/javafx-sdk-$javafx_version/lib" --add-modules javafx.controls,javafx.fxml "$target"
}

compile_javafx() {
    local class_name="$1"
    local javafx_version="$2"
    
    echo -e "Compiling...\n"
    javafx "javac" "$class_name" "$javafx_version"
}

run_javafx() {
    local class_name=$(echo "$1" | cut -d '.' -f 1)
    local javafx_version="$2"
    
    echo -e "Running...\n"
    javafx "java" "$class_name" "$javafx_version"
}

main() {
    if [ "$1" == "-v" ]; then
        ls "$JAVAFX_PATH"
        exit 0
    fi
    
    compile_javafx "$@" && run_javafx "$@" || echo -e "\e[31mError on JavaFX compilation."; exit 1
}

main "$@"

