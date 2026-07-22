#!/bin/sh

export TZ=GMT
export DEBIAN_FRONTEND=noninteractive

apt update
apt install -y ninja-build gettext cmake unzip curl git ripgrep

mkdir nvim-build
cd nvim-build

git clone https://github.com/neovim/neovim.git -b v0.12.4
cd neovim
make CMAKE_BUILD_TYPE=Release
make install

cd ../..
rm -r nvim-build

rm -rf /var/lib/apt/lists/*
