#!/bin/bash
shopt -s nullglob
folder=""
folder_ext=""
for i in C64\ Dreams/C64\ Dreams/Games/*/; do
    if [[ "$(basename "$i" | cut -c1)" != "!" ]]; then
        file=$(basename "$i")
        letter=$(echo "${file:0:1}" | tr '[:digit:]' '#' | tr '[:lower:]' '[:upper:]')
        if [[ "$folder" != "$letter" ]]; then
            count=0
            folder=$letter
        fi
        folder_ext=$((count++ / 256))
        mkdir -p THEC64/$folder$folder_ext/$file
        for f in "$i"*.{d64,g64,d81,d82,crt,tap,t64,prg}; do
            cp "$f" THEC64/$folder$folder_ext/$file
            cp THEC64-default.cjm THEC64/$folder$folder_ext/$file
        done
    fi
done
