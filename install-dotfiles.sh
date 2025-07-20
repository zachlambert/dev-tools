#!/bin/bash

config_dir=$HOME/.config
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

install_neovim_config() {
    echo -e "${NC}Setting up neovim config"
    dir="$config_dir/nvim"
    if [[ -h "$dir" ]]; then
        rm $dir
    elif [[ -e $dir ]]; then
        echo -e "${RED}- $dir already exists and is not a symbolic link"
        exit 1
    fi

    echo -e "${GREEN}- $dir -> dotfiles/nvim"
    ln -s "$(pwd)/dotfiles/nvim" $dir
}

install_wezterm_config() {
    echo -e "${NC}Setting up wezterm config"
    dir="$config_dir/wezterm"
    if [[ -h $dir ]]; then
        rm $dir
    elif [[ -e $dir ]]; then
        echo -e "${RED}- $dir already exists and is not a symbolic link"
        exit 1
    fi

    echo -e "${GREEN}- $dir -> dotfiles/wezterm"
    ln -s "$(pwd)/dotfiles/wezterm" $dir
}

install_shell_config() {
    echo -e "${NC}Setting up shell config"
    bashrc="$HOME/.bashrc"
    if [[ -f $bashrc || -h $bashrc ]]; then
        rm $bashrc
    fi
    echo -e "${GREEN}- $bashrc -> dotfiles/shell/.bashrc"
    ln -s "$(pwd)/dotfiles/shell/.bashrc" $bashrc

    zshrc="$HOME/.zshrc"
    if [[ -f $zshrc || -h $zshrc ]]; then
        rm $zshrc
    fi
    echo -e "${GREEN}- $zshrc -> dotfiles/shell/.zshrc"
    ln -s "$(pwd)/dotfiles/shell/.zshrc" $zshrc

    shell_dir="$config_dir/shell"
    if [[ -h $shell_dir ]]; then
        rm $shell_dir
    elif [[ -e $shell_dir ]]; then
        echo -e "${RED}- $shell_dir already exists and is not a symbolic link"
        exit 1
    fi
    echo -e "${GREEN}- $shell_dir -> dotfiles/shell"
    ln -s "$(pwd)/dotfiles/shell/shell" $shell_dir

    bash_dir="$config_dir/bash"
    if [[ -h $bash_dir ]]; then
        rm $bash_dir
    elif [[ -e $bash_dir ]]; then
        echo "${RED}- $bash_dir already exists and is not a symbolic link"
        exit 1
    fi
    echo -e "${GREEN}- $bash_dir -> dotfiles/bash"
    ln -s "$(pwd)/dotfiles/shell/bash" $bash_dir

    zsh_dir="$config_dir/zsh"
    if [[ -h $zsh_dir ]]; then
        rm $zsh_dir
    elif [[ -e $zsh_dir ]]; then
        echo -e "${RED}- $zsh_dir already exists and is not a symbolic link"
        exit 1
    fi
    echo -e "${GREEN}- $zsh_dir -> dotfiles/zsh"
    ln -s "$(pwd)/dotfiles/shell/zsh" $zsh_dir
}

install_git_config() {
    echo -e "${NC}Setting up git config"
    gitignore="$HOME/.config/gitignore"
    if [[ -f $gitignore || -h $gitignore ]]; then
        rm $gitignore
    fi
    echo -e "${GREEN}- $gitignore -> dotfiles/git/gitignore"
    ln -s $(pwd)/dotfiles/git/gitignore $gitignore
}

install_neovim_config
install_wezterm_config
install_shell_config
install_git_config
