#!/usr/bin/env bash

set -x
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undo

if true; then
    # Install awesome-vimrc
    if [ ! -e ~/.vim_runtime ]; then
        git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
        sh ~/.vim_runtime/install_awesome_vimrc.sh
        # but move auto-pairs
        mv ~/.vim_runtime/sources_non_forked/auto-pairs ~/.vim_runtime/
    fi
fi

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
if [ ! -e ~/.vim/autoload/pathogen.vim ]; then
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# Install vim-syntastic as pathogen bundle
if [ ! -e ~/.vim/bundle/syntastic ]; then
    cd ~/.vim/bundle && \
    git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
fi

touch "$HOME/.vimrc"
cp "$HOME"/.vimrc "$HOME"/.vimrc.bak.$(date +"%Y-%m-%d_%H:%M:%S")
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp "$DIR/vimrc" ~/.vimrc
