for file in ~/.config/shell/*; do
    source $file
done
if [ -d ~/.config/shell-extra/ ]; then
    for file in ~/.config/shell-extra/*; do
        source $file
    done
fi
for file in ~/.config/zsh/*; do
    source $file
done

# export ZSH="$HOME/.oh-my-zsh"
source $HOME/.oh-my-zsh/oh-my-zsh.sh

have_ros=0
if [ -f /opt/ros/jazzy/setup.zsh ]; then
    source /opt/ros/jazzy/setup.zsh
    have_ros=1
fi
if [ -f /home/ws/install/setup.zsh ]; then
    source /home/ws/install/setup.zsh
fi
if [ -f /home/ws/kdlidar_install/setup.zsh ]; then
    source /home/ws/kdlidar_install/setup.zsh
fi
if [ -f /home/ws/kdrobot_install/setup.zsh ]; then
    source /home/ws/kdrobot_install/setup.zsh
fi

# Need to run after all workspace sourcing
if [ $have_ros -eq 1 ]; then
    eval "$(register-python-argcomplete ros2)"
    eval "$(register-python-argcomplete colcon)"
    export RMW_IMPLEMENTATION=rmw_zenoh_cpp
fi

export PATH=~/.cargo/bin:$PATH

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/home/zach/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/zach/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/zach/build/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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

