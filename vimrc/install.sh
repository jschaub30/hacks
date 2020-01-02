#!/usr/bin/env bash

set -x
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undo

# Install awesome-vimrc
if [ ! -e ~/.vim_runtime ]; then
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
fi

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install vim-syntastic as pathogen bundle
if [ ! -e ~/.vim/bundle/syntastic ]; then
    cd ~/.vim/bundle && \
    git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
fi

cp ~/.vimrc ~/.vimrc.bak
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp "$DIR/vimrc" ~/.vimrc
