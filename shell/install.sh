#!/usr/bin/env bash

cat > ~/.inputrc <<'EOF'
"\e[A": history-search-backward
"\e[B": history-search-forward
set enable-bracketed-paste off
EOF

set -e
mkdir -p "$HOME/.backups/"
if [ -e "$HOME/.local" ]; then
    BAK="$HOME/.backups/"$(date +"%Y.%m.%d_%H:%M:%S")
    echo "Backing up $HOME/.local to $BAK"
    cp -r "$HOME/.local" "$BAK"
fi
rm -rf ~/.local/bashrc.d

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p ~/.local/bashrc.d ~/.local/bashrc.local ~/.local/bin ~/.local/profile.d
for FN in "${DIR}/bashrc.d"/*; do
    cp "$FN" ~/.local/bashrc.d/
done

for FN in "${DIR}/bin"/*; do
    cp "$FN" ~/.local/bin/
done

touch ~/.local/bashrc.d/000.keep.sh
cat > ~/.bashrc <<'EOF'
# do not edit this file. put files in the dir below.
for FN in $HOME/.local/bashrc.d/*.sh ; do
    source "$FN"
done
for FN in $HOME/.local/bashrc.local/*.sh ; do
    source "$FN"
done
EOF
touch ~/.local/profile.d/000.keep.sh
touch ~/.local/profile.d/900.keep.sh
cat > ~/.profile <<'EOF'
# do not edit this file. put files in the dir below.
for FN in $HOME/.local/profile.d/[0-8]*.sh ; do
    source "$FN"
done
source ~/.bashrc
for FN in $HOME/.local/profile.d/9*.sh ; do
    source "$FN"
done
EOF
