#!/usr/bin/env bash
echo "WARNING: these files and directories will be overwritten:"
echo "  ~/.bashrc"
echo "  ~/.profile"
echo "  ~/.inputrc"
echo "  ~/.local/bashrc.d/*"
echo "  ~/.local/profile.d/*"
echo
echo "Put all scripts local to this machine in:"
echo "  ~/.local/bashrc.local  # will not be altered by this script"
echo
echo "Backups will be created in case something goes wrong."
echo

while true; do
    read -p "Continue? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

set -e
mkdir -p "$HOME/.backups/"
if [ -e "$HOME/.local" ]; then
    BAK="$HOME/.backups/"$(date +"%Y.%m.%d_%H%M%S")
    mkdir -p "$BAK"
    echo "Saving backups to $BAK"
    touch ~/.local ~/.bashrc ~/.profile
    cp -r ~/.local "$BAK/dot_local"
    cp ~/.bashrc "$BAK/dot_bashrc"
    cp ~/.profile "$BAK/dot_profile"
fi

echo

echo "Writing ~/.inputrc to search through your history using the up and down arrows"
cat > ~/.inputrc <<'EOF'
"\e[A": history-search-backward
"\e[B": history-search-forward
set enable-bracketed-paste off
EOF

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
rm -rf ~/.local/bashrc.d
rm -rf ~/.local/profile.d
mkdir -p ~/.local/bashrc.d ~/.local/bashrc.local ~/.local/bin ~/.local/profile.d

echo
for FN in "${DIR}/bashrc.d"/*; do
    echo "Copying $FN to ~/.local/bashrc.d/"
    cp "$FN" ~/.local/bashrc.d/
done

echo
if [[ "$(uname)" == "Darwin" ]]; then
  for FN in "${DIR}/bashrc.mac"/*; do
      echo "Copying $FN to ~/.local/bashrc.mac/"
      cp "$FN" ~/.local/bashrc.d/
  done
fi

echo
if [ -f "${DIR}/bin" ]; then
    for FN in "${DIR}/bin"/*; do
        echo "Copying $FN to ~/.local/bin"
        cp "$FN" ~/.local/bin/
    done
fi

echo
for FN in "${DIR}/profile.d"/*; do
    echo "Copying $FN to ~/profile.d/"
    cp "$FN" ~/.local/profile.d/
done

echo "Creating ~/.bashrc"
touch "$HOME/.local/bashrc.local/000.keep.sh"
cat > ~/.bashrc <<'EOF'
# do not edit this file. put files in the dir below.
for FN in $HOME/.local/bashrc.d/*.sh ; do
    source "$FN"
done
for FN in $HOME/.local/bashrc.local/*.sh ; do
    source "$FN"
done
EOF

echo "Creating ~/.profile"
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

echo "Checking timezone"
timedatectl

echo
echo "If needed, set the timezone using 'sudo timedatectl set-timezone America/Denver'"

