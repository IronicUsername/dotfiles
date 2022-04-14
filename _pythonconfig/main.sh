#!/bin/bash
echo "==> Running main.sh"
current_relative_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

mkdir -p $XDG_CONFIG_HOME/python
ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/python $XDG_CONFIG_HOME/python

echo "Setting up zprofile..."
ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/zsh/zprofile $XDG_CONFIG_HOME/zsh/.zprofile

echo "Setting up python"
$current_relative_path/python.sh
