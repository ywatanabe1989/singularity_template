#!/bin/bash

install-gh() {
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    apt update
    apt install -y gh

    gh --version
}

install-basics() {
    apt update
    apt upgrade -y

    apt install -y build-essential
    apt install -y software-properties-common
}

install-apt-packages () {
    apt update

    apt install -y libffi-dev
    apt install -y libgl1-mesa-dev
    apt install -y libc6-dev
    apt install -y htop
    apt install -y ffmpeg
    apt install -y libffmpeg-dev
    apt install -y ripgrep
    apt install -y portaudio19-dev
    apt install -y git
    apt install -y emacs
    apt install -y libssl-dev
    apt install -y wget
    apt install -y gcc
    apt install -y make
    apt install -y sshpass
    apt install -y locales
    apt install -y which

    apt upgrade -y
}

install-tree () {
    wget https://gitlab.com/OldManProgrammer/unix-tree/-/archive/2.1.1/unix-tree-2.1.1.tar.bz2
    tar -xjvf unix-tree-2.1.1.tar.bz2
    cd unix-tree-2.1.1
    make -j$(nproc)
    make -j$(nproc) install PREFIX=/usr/local
    cd ..
    rm -rf unix-tree*

    tree --version
}

install-autossh() {
    apt install -y autossh

    autossh -V
}

install-git-crypt () {
    apt install -y git-crypt

    git-crypt --version
}

main () {
    install-basics
    install-apt-packages
    # After the basic installations are completed.
    install-tree
    install-autossh
    install-git-crypt
    install-gh
}

main

# EOF
