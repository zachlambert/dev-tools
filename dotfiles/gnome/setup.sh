#!/bin/sh

# Disable the Super-Q shortcut being overridden to open the dock
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false

# Disable animations
gsettings set org.gnome.desktop.interface enable-animations false
