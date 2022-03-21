#!/bin/bash
echo "==> Running main.sh"
current_relative_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

echo "Setting up pyenv..."
ln -s $HOME/.config/dotfiles/_shellconfig/zsh/.zprofile $HOME/.zprofile

echo "Setting up python"
$current_relative_path/python.sh
