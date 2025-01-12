#!/bin/sh


config_dir=$HOME/.config
nvim_dir="$config_dir/nvim"
wezterm_dir="$config_dir/wezterm"

# if [ -h $nvim_dir]; then
#     rm $nvim_dir
# elif [ -e $nvim_dir ]; then
#     echo "Nvim config already exists and is not a symbolic link"
#     exit 1
# fi

if [ -h $wezterm_dir ]; then
    echo "Wezterm symbolic link exists already, removing"
    rm $wezterm_dir
elif [ -e $wezterm_dir ]; then
    echo "Wezterm config already exists and is not a symbolic link"
    exit 1
fi

# ln -s nvim $nvim_dir
echo "Creating symlink to wezterm config at $wezterm_dir"
ln -s "$(pwd)/wezterm" $wezterm_dir
