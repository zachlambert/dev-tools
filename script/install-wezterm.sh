#!/bin/bash

sudo apt remove wezterm
sudo apt install wezterm-nightly

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which wezterm) 20
sudo update-alternatives --set x-terminal-emulator $(which wezterm)
