#!/bin/sh

cd /home/kudan

touch feature-debug.txt
echo "_CONTAINER_USER=$_CONTAINER_USER" >> feature-debug.txt
echo "_REMOTE_USER=$_REMOTE_USER" >> feature-debug.txt
echo "USER=$USER" >> feature-debug.txt
# echo "_CONTAINER_USER=${_CONTAINER_USER}" >> feature-debug.txt
# echo "_REMOTE_USER=${_REMOTE_USER}" >> feature-debug.txt
# echo "USER=${USER}" >> feature-debug.txt
echo "Whomai=$(whoami)" >> feature-debug.txt

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

# rm -r dev-tools

# First run of nvim -> install plugins
nvim --headless -V +qall

# Set git settings
git config --global core.excludesfile /home/$USER/.config/gitignore

# Install extra useful packages
apt update && \
  apt install -y less fzf xclip && \
  rm -rf /var/lib/apt/lists/*
