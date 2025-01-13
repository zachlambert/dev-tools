#!/bin/bash

config_dir=$HOME/.config
nvim_dir="$config_dir/nvim"
wezterm_dir="$config_dir/wezterm"
zsh_dir="$config_dir/zsh"

install_neovim_config() {
    if [[ -h $nvim_dir ]]; then
        rm $nvim_dir
    elif [[ -e $nvim_dir ]]; then
        echo "Nvim config already exists and is not a symbolic link"
        exit 1
    fi

    echo "Creating symlink to nvim config at $nvim_dir"
    ln -s "$(pwd)/nvim" $nvim_dir
}

install_wezterm_config() {
    if [[ -h $wezterm_dir ]]; then
        echo "Wezterm symbolic link exists already, removing"
        rm $wezterm_dir
    elif [[ -e $wezterm_dir ]]; then
        echo "Wezterm config already exists and is not a symbolic link"
        exit 1
    fi

    echo "Creating symlink to wezterm config at $wezterm_dir"
    ln -s "$(pwd)/wezterm" $wezterm_dir
}

install_zsh_config() {
    zshrc="$HOME/.zshrc"
    if [[ -f $zshrc ]]; then
        echo "Removing existing .zshrc file"
        rm $zshrc
    fi
    echo "Creating symlink  to .zshrc at $zshrc"
    ln -s "$(pwd)/dotfiles/.zshrc" $zshrc

    if [[ -h $zsh_dir ]]; then
        echo "zsh symbolic link exists already, removing"
        rm $zsh_dir
    elif [[ -e $zsh_dir ]]; then
        echo "zsh config already exists and is not a symbolic link"
        exit 1
    fi

    echo "Creating symlink to zsh config at $zsh_dir"
    ln -s "$(pwd)/zsh" $zsh_dir
}

install_git_config() {
    gitignore="$HOME/.config/gitignore"
    if [[ -f $gitignore ]]; then
        echo "Removing existing global gitignore file"
        rm $gitignore
    fi
    echo "Creating symlink to global gitignore file at $gitignore"
    ln -s $(pwd)/dotfiles/gitignore $gitignore
}

install_neovim_config
install_wezterm_config
install_zsh_config
install_git_config
