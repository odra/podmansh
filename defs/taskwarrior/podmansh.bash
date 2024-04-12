#!/bin/bash

if [ "${BASH_SOURCE[0]}" -ef "${0}" ]; then
    echo 'This file should sourced.'
    exit 1
fi

podmansh::build() {
    podman build \
        -t localhost/taskwarrior:latest \
        -f image/Containerfile \
        image/
}

podmansh::install() {
    for fname in $(ls bin/); do
        echo "Installing bin/$fname to $HOME/.local/bin/podmansh/$fname"
        cp bin/$fname $HOME/.local/bin/podmansh/
    done 
}
