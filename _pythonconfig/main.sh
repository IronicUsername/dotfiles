#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

echo "==> Running main.sh"

echo "Setting up pyenv..."
ln -s $HOME/.config/dotfiles/_shellconfig/zsh/.zprofile $HOME/.zprofile

echo "Setting up python"
$parent_path/python.sh
