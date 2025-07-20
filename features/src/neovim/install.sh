#!/bin/bash

export TZ=GMT
export DEBIAN_FRONTEND=noninteractive

apt update
apt install -y ninja-build gettext cmake unzip curl git

mkdir nvim-build
cd nvim-build

git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
make install

cd ../..
rm -r nvim-build

NODE_VERSION=16.13.0
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
NVM_DIR=/root/.nvm
source "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
source "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
source "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
export PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
node --version
npm --version

rm -rf /var/lib/apt/lists/*
