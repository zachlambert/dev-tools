#!/bin/zsh

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# NOTE: This is overwritten by oh-my-zsh
# when running source ~/.oh-my-zsh/oh-my-zsh.sh
# Instead, use the plugin vi-mode to setup
# set -o vi
