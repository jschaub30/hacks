#!/usr/bin/env bash
# Install basic homebrew packages, if necessary

if ! which brew >/dev/null 2>&1 ; then
    echo "brew not installed. Exiting..."
    exit 1
fi

for PKG in jq tree shellcheck qpdf wget pandoc xz git-quick-stats pyenv; do
    if which "$PKG" >/dev/null 2>&1; then
        echo "$PKG already installed"
    else
        echo "Installing $PKG"
        brew install "$PKG"
    fi
done
if which gtimeout >/dev/null 2>&1; then
    echo "coreutils already installed"
else
    echo "Installing coreutils"
    brew install coreutils
fi

if which convert >/dev/null 2>&1; then
    echo "ImageMagick already installed"
else
    echo "Installing ImageMagick"
    brew install imagemagick
fi

if which pdftohtml >/dev/null 2>&1; then
    echo "poppler already installed"
else
    echo "Installing poppler"
    brew install poppler
fi

if which mc >/dev/null 2>&1; then
    echo "mc already installed"
else
    echo "Installing minio command line tool"
    brew install minio-mc
fi

if which gpg >/dev/null 2>&1; then
    echo "gnupg already installed"
else
    echo "Installing gnupg"
    brew install gnupg
fi

if which pdflatex >/dev/null 2>&1; then
    echo "basictex already installed"
else
    echo "Installing basictex"
    brew install --cask basictex
fi

# if pyenv virtualenv -h >/dev/null 2>&1; then
    # echo "pyenv-virtualenv already installed"
# else
    # echo "Installing pyenv-virtualenv"
    # brew install pyenv-virtualenv
# fi
