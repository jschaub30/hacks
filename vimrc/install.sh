#!/usr/bin/env bash

set -x
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undo

DATESTR=$(date +"%Y-%m-%d_%H:%M:%S")
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if false; then
	# Install awesome-vimrc
	if [ ! -e ~/.vim_runtime ]; then
		git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
		sh ~/.vim_runtime/install_awesome_vimrc.sh
		# but move auto-pairs
		mv ~/.vim_runtime/sources_non_forked/auto-pairs ~/.vim_runtime/
	fi
fi

if false; then
	# Install pathogen
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	if [ ! -e ~/.vim/autoload/pathogen.vim ]; then
		curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	fi
fi

if false; then
	# vim-syntastic
	if [ ! -e ~/.vim/bundle/syntastic ]; then
		mkdir -p ~/.vim/pack/git-plugins/start
		git clone --depth 1 https://github.com/vim-syntastic/syntastic.git ~/.vim/pack/git-plugins/start/syntastic
	fi
fi

if true; then
	# ALE
	mkdir -p ~/.vim/pack/git-plugins/start
	if [ ! -e ~/.vim/pack/git-plugins/start/ale ]; then
		git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale
	fi
fi

if true; then
	# auto-pairs
	mkdir -p ~/.vim/pack/git-plugins/start
	if [ ! -e ~/.vim/pack/git-plugins/start/auto-pairs ]; then
		git clone --depth 1 https://github.com/jiangmiao/auto-pairs.git ~/.vim/pack/git-plugins/start/auto-pairs
	fi
fi

touch "$HOME/.vimrc"
cp "$HOME/.vimrc" "$HOME/.vimrc.bak.$DATESTR"
cp "$DIR/vimrc" ~/.vimrc

mkdir -p ~/.config/ruff
cp "$DIR"/ruff.toml ~/.config/ruff/

echo "Be sure to pip install 'ruff', 'isort', and 'pyright'"
