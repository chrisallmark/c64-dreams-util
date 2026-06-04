#!/bin/bash
shopt -s nullglob

src="C64 Dreams/C64 Dreams/Games"
cjm="THEC64-default.cjm"

if [[ ! -d "$src" ]]; then
    echo "Error: source directory not found: $src" >&2
    exit 1
fi
if [[ ! -f "$cjm" ]]; then
    echo "Error: joystick mapping file not found: $cjm" >&2
    exit 1
fi

folder=""
folder_ext=""
for i in "$src"/*/; do
    file=$(basename "$i")
    if [[ "${file:0:1}" != "!" ]]; then
        letter=$(echo "${file:0:1}" | tr '[:digit:]' '#' | tr '[:lower:]' '[:upper:]')
        if [[ "$folder" != "$letter" ]]; then
            count=0
            folder=$letter
        fi
        folder_ext=$((count++ / 256))
        dest="THEC64/$folder$folder_ext/$file"
        echo "Processing: $file"
        mkdir -p "$dest"
        for f in "$i"*.{d64,g64,d81,d82,crt,tap,t64,prg}; do
            [[ -f "$f" ]] || continue
            mv "$f" "$dest"
            cp "$cjm" "$dest"
        done
        if [[ -z "$(ls -A "$dest")" ]]; then
            rmdir "$dest"
        fi
    fi
done
