#!/bin/bash
echo "==> Running zsh.sh"

mkdir -p $HOME/.zsh/completions
mkdir -p $HOME/.zsh/custom/themes
mkdir -p $HOME/.zsh/custom/plugins
ln -s $HOME/.config/dotfiles/_shellconfig/zsh/install.sh $HOME/.zsh/
ln -s $HOME/.config/dotfiles/_shellconfig/zsh/custom $HOME/.zsh/
touch $HOME/.hushlogin
