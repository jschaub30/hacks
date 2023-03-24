#!/usr/bin/env bash

set -e
set -x

sudo apt -y update
sudo apt install -y \
    git \
    vim \
    build-essential \
    zlib1g-dev \
    net-tools \
    tree \
    shellcheck \
    htop \
    dstat \
    pandoc \
    poppler-utils \
    python3-pip \
    libbz2-dev \
    libffi-dev \
    libreadline-dev \
    libncurses-dev \
    libsqlite3-dev \
    libssl-dev \
    liblzma-dev


if which pyenv > /dev/null 2>&1; then
    echo "pyenv already installed"
else
    echo "Installing pyenv"
    curl https://pyenv.run | bash
fi
