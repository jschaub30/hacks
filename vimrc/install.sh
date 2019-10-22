#!/bin/bash

set -x
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undo

git clone --recursive git@github.com:codepushr/vim-go-runtime.git ~/.vim-go-runtime
sh ~/.vim-go-runtime/install.sh

mv ~/.vim_go_runtime/bundle/pristine/auto-pairs/plugin/auto-pairs.vim \
   ~/.vim_go_runtime/bundle/pristine/auto-pairs/plugin/auto-pairs.old

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cat "$DIR/vimrc" > ~/.vimrc
