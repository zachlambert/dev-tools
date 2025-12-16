#!/bin/sh

apt update
apt install -y zsh

OMZSH="$HOME/.oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone "https://github.com/zsh-users/zsh-autosuggestions" "$OMZSH/plugins/zsh-autosuggestions"
git clone "https://github.com/zsh-users/zsh-syntax-highlighting" "$OMZSH/plugins/zsh-syntax-highlighting"

rm -rf /var/lib/apt/lists/*
