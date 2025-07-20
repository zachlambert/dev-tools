for file in ~/.config/shell/*; do
    source $file
done
for file in ~/.config/zsh/*; do
    source $file
done

# export ZSH="$HOME/.oh-my-zsh"
source $HOME/.oh-my-zsh/oh-my-zsh.sh
