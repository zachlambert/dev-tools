#!/bin/sh

cd /home/kudan
echo "User=$USER" >> what-is-user.txt

mkdir -p .config

git clone https://github.com/zachlambert/dev-tools.git
cd dev-tools/dotfiles

mkdir -p .config
cp -r nvim .config/nvim
cp -r shell/shell .config/shell
cp -r shell/bash .config/bash
cp -r shell/zsh .config/zsh
cp -r shell/.bashrc .bashrc
cp -r shell/.zshrc .zshrc
cp git/gitignore .config/gitignore

# rm -r dev-tools

# First run of nvim -> install plugins
nvim --headless -V +qall

# Set git settings
git config --global core.excludesfile /home/$USER/.config/gitignore

# Install extra useful packages
apt update && \
  apt install -y less fzf xclip && \
  rm -rf /var/lib/apt/lists/*
