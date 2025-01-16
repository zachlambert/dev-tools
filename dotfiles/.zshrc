export ZSH="$HOME/.oh-my-zsh"
for file in ~/.config/zsh/*; do
    source $file
done
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

xhost +local:docker
export AWS_PROFILE=ReadOnlyAccess-VaarstProduction
