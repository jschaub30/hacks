#!/usr/bin/env bash

set -e
set -x

sudo yum -y update
sudo yum install -y \
    git \
    vim \
    net-tools \
    tree \
    htop \
    poppler-utils \
    python3-pip \
    python3.12-pip \
    tmux \
    nodejs \
    npm \
    golang-go


if which pyenv > /dev/null 2>&1; then
    echo "pyenv already installed"
else
    echo "Installing pyenv"
    curl https://pyenv.run | bash
fi
