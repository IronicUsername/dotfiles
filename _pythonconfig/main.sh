#!/bin/bash
echo "==> Running main.sh"
current_relative_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

echo "Setting up pyenv..."
ln -s $XDG_CONFIG_HOME/dotfiles/_shellconfig/zsh/zprofile $XDG_CONFIG_HOME/zsh/.zprofile

echo "Setting up python"
$current_relative_path/python.sh
