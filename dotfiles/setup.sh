#!/bin/bash

# Install nvm and node
export NVM_DIR="$HOME/.nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | PROFILE=/dev/null bash

source $NVM_DIR/nvm.sh
nvm install node

sudo apt update
sudo apt install -y zsh

# chsh -s $(which zsh)

OMZSH="$HOME/.oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone "https://github.com/zsh-users/zsh-autosuggestions" "$OMZSH/plugins/zsh-autosuggestions"
git clone "https://github.com/zsh-users/zsh-syntax-highlighting" "$OMZSH/plugins/zsh-syntax-highlighting"

# First run of nvim -> install plugins
nvim --headless -V +qall

git config --global core.excludesfile ~/.config/gitignore

sudo apt install -y less fzf xclip
