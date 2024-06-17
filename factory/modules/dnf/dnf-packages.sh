#!/bin/bash

install-basics() {
    dnf -y update

    dnf -y install setup
    dnf -y groupinstall "Development Tools"
    dnf -y install dnf-plugins-core
    dnf -y install epel-release
    dnf config-manager --set-enabled powertools
    dnf config-manager --add https://negativo17.org/repos/epel-multimedia.repo

    dnf -y upgrade
}

install-dnf-packages () {
    dnf update

    dnf -y install libffi
    dnf -y install libffi-devel
    dnf -y install mesa-libGL
    dnf -y install mesa-libGL-devel
    dnf -y install glibc
    dnf -y install glibc-devel
    dnf -y install tree
    dnf -y install htop
    dnf -y install ffmpeg
    dnf -y install ffmpeg-devel
    dnf -y install ripgrep
    dnf -y install portaudio
    dnf -y install portaudio-devel
    dnf -y install git
    dnf -y install emacs
    dnf -y install openssl
    dnf -y install openssl-devel
    dnf -y install wget
    dnf -y install gcc
    dnf -y install make
    dnf -y install sshpass

    dnf -y upgrade
}

install-autossh() {
    dnf install
    wget http://www.harding.motd.ca/autossh/autossh-1.4e.tgz
    tar -xf autossh-1.4e.tgz
    cd autossh-1.4e
    ./configure
    make -j32
    make -j32 install PREFIX=/usr/local
    cd ..
    rm autossh* -rf
}

install-git-crypt () {
    git clone https://github.com/AGWA/git-crypt.git
    cd git-crypt
    make -j 32
    make install -j 32 PREFIX=/usr/local
}

main () {
    install-basics
    install-dnf-packages
    install-autossh
    install-git-crypt
}

main
