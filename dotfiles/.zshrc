export ZSH="$HOME/.oh-my-zsh"
for file in ~/.config/zsh/*; do
    source $file
done
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:/$HOME/.cache/rebar3/bin"

xhost +local:docker > /dev/null 2>&1
# export PATH="/home/zach/.pixi/bin:$PATH"
# eval "$(pixi completion --shell zsh)"

# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select
