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
chown $_CONTAINER_USER:$_CONTAINER_USER .bashrc
chown $_CONTAINER_USER:$_CONTAINER_USER .zshrc
rm -r dev-tools

# Install extra useful packages
apt update && \
  apt install -y less fzf xclip curl && \
  rm -rf /var/lib/apt/lists/*

# Install node
su $_CONTAINER_USER -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash'
su $_CONTAINER_USER -c 'bash -c "source ~/.bashrc; nvm install node"'

# First run of nvim -> install plugins
su $_CONTAINER_USER -c "nvim --headless -V +qall"

# Set git settings
su $_CONTAINER_USER -c 'git config --global core.excludesfile /home/$USER/.config/gitignore'
