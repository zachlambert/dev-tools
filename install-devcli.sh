#!/bin/bash

install_path=/usr/bin/devcli

if [[ -f $install_path ]]; then
  sudo rm /usr/bin/devcli
fi

if [[ $# -gt 0 ]] && [[ $1 == "-s" ]]; then
  echo "Symlink install: $install_path"
  sudo ln -s $(pwd)/devcli $install_path
else
  echo "Install: $install_path"
  sudo cp devcli $install_path
fi
