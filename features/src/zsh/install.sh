#!/bin/sh

apt update
apt install -y zsh

su $_CONTAINER_USER -c 'sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
su $_CONTAINER_USER -c 'git clone "https://github.com/zsh-users/zsh-autosuggestions" "/home/$USER/.oh-my-zsh/plugins/zsh-autosuggestions"'
su $_CONTAINER_USER -c 'git clone "https://github.com/zsh-users/zsh-syntax-highlighting" "/home/$USER/.oh-my-zsh/plugins/zsh-syntax-highlighting"'

rm -rf /var/lib/apt/lists/*
