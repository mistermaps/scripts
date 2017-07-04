#!/bin/bash
up() { curl -F"$1" 'http://0x0.st'; }

if [[ $# == 0 ]]; then
    read -p "url/file: " targ
    if echo "$targ" | grep -q 'http\(s\?\)://'; then
        up "url=$targ"
    else
        up "file=@$targ"
    fi
else
    for file in $@; do
        up "file=@$file"
    done
fi 
