#!/bin/bash

zsh --version > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
    echo "zsh not installed, installing"
    apt install zsh
else
    echo "zsh already installed, skipping"
fi

if [[ $(echo $SHELL) != $(which zsh) ]]; then
    echo "zsh not set as default shell, changing default shell"
    chsh -s $(which zsh)
else
    echo "zsh already default shell, skipping"
fi

OMZSH="$HOME/.oh-my-zsh"

if [[ ! -d $OMZSH ]]; then
    echo "Oh-my-zsh not installed, installing"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh-my-zsh installed already, skipping"
fi

if [[ ! -d "$OMZSH/plugins/zsh-autosuggestions" ]]; then
    echo "Plugin zsh-autosuggestions not installed, installing now"
    git clone "https://github.com/zsh-users/zsh-autosuggestions" "$OMZSH/plugins/zsh-autosuggestions"
else
    echo "Plugin zsh-autosuggestions already installed, skipping"
fi

if [[ ! -d "$OMZSH/plugins/zsh-syntax-highlighting" ]]; then
    echo "Plugin zsh-syntax-highlighting not installed, installing now"
    git clone "https://github.com/zsh-users/zsh-syntax-highlighting" "$OMZSH/plugins/zsh-syntax-highlighting"
else
    echo "Plugin zsh-syntax-highlighting already installed, skipping"
fi
