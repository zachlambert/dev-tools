#!/bin/sh

sudo touch /is-this-created.txt
cd /home/kudan
touch test-dotfiles.txt
exit 0

# mkdir -p /home/$USER/.config
# 
# git clone https://github.com/zachlambert/dev-tools.git
# cd dev-tools/dotfiles
# 
# mkdir -p /home/$USER/.config
# cp -r nvim /home/$USER/.config/nvim
# cp -r shell/shell /home/$USER/.config/shell
# cp -r shell/bash /home/$USER/.config/bash
# cp -r shell/zsh /home/$USER/.config/zsh
# cp -r shell/.bashrc /home/$USER/.bashrc
# cp -r shell/.zshrc /home/$USER/.zshrc
# cp git/gitignore /home/$USER/.config/gitignore
# 
# cd ../..
# rm -r dev-tools
# 
# # First run of nvim -> install plugins
# nvim --headless -V +qall
# 
# # Set git settings
# git config --global core.excludesfile /home/$USER/.config/gitignore
# 
# # Install extra useful packages
# apt update && \
#   apt install -y less fzf xclip && \
#   rm -rf /var/lib/apt/lists/*
# 
