for file in ~/.config/shell/*; do
    source $file
done
if [ -d ~/.config/shell-extra/ ]; then
    for file in ~/.config/shell-extra/*; do
        source $file
    done
fi
for file in ~/.config/bash/*; do
    source $file
done
if [ -f $HOME/.cargo/env ]; then
    . "$HOME/.cargo/env"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/zach/build/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zach/build/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/zach/build/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/zach/build/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
