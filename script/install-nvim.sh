#!/bin/bash

sudo apt update
sudo apt install -y ninja-build gettext cmake unzip curl

orig_dir=$(pwd)

mkdir -p $HOME/build
cd $HOME/build

git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
source ~/.bashrc
nvm install node

sudo rm -rf /var/lib/apt/lists/*
cd $orig_dir
