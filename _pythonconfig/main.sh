#!/bin/bash
echo "==> Running main.sh"
current_relative_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

mkdir -p $XDG_CONFIG_HOME/python
ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/python/pythonrc $XDG_CONFIG_HOME/python/pythonrc

echo "Setting up pyenv..."
ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/zsh/zprofile $XDG_CONFIG_HOME/zsh/.zprofile

echo "Setting up python"
$current_relative_path/python.sh
