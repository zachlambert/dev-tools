#!/bin/sh

git clone https://github.com/zachlambert/dev-tools.git
cd dev-tools/dotfiles

cp -r nvim ~/.config/.config/nvim
cp -r shell/shell ~/.config/.config/shell
cp -r shell/bash ~/.config/.config/bash
cp -r shell/zsh ~/.config/.config/zsh
cp -r shell/.bashrc ~/.config/.bashrc
cp -r shell/.zshrc ~/.config/.zshrc
cp git/gitignore ~/.config/gitignore

cd ../..
rm -r dev-tools

# First run of nvim -> install plugins
nvim --headless -V +qall

# Set git settings
git config --global core.excludesfile ~/.config/gitignore

# Install extra useful packages
apt update && \
  apt install -y less fzf xclip && \
  rm -rf /var/lib/apt/lists/*

