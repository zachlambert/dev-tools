#!/bin/sh

sudo apt update
sudo apt install -y ninja-build gettext cmake unzip curl

mkdir nvim-build
cd nvim-build

git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

cd ../..
rm -r nvim-build

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
source ~/.bashrc
nvm install node

sudo rm -rf /var/lib/apt/lists/*
