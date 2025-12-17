#!/bin/sh

cd /home/$_CONTAINER_USER

mkdir -p .config

git clone https://github.com/zachlambert/dev-tools.git

dotfiles=dev-tools/dotfiles
cp -r $dotfiles/nvim .config/nvim
cp -r $dotfiles/shell/shell .config/shell
cp -r $dotfiles/shell/bash .config/bash
cp -r $dotfiles/shell/zsh .config/zsh
cp -r $dotfiles/shell/.bashrc .bashrc
cp -r $dotfiles/shell/.zshrc .zshrc
cp $dotfiles/git/gitignore .config/gitignore

chown -R $_CONTAINER_USER:$_CONTAINER_USER .config
rm -r dev-tools

# First run of nvim -> install plugins
su $_CONTAINER_USER -c nvim --headless -V +qall

# Set git settings
su $_CONTAINER_USER git config --global core.excludesfile /home/$_CONTAINER_USER/.config/gitignore

# Install extra useful packages
# apt update && \
#   apt install -y less fzf xclip && \
#   rm -rf /var/lib/apt/lists/*
