#!/bin/bash
echo "==> Running zsh.sh"

mkdir -p $HOME/.config/zsh/completions
mkdir -p $HOME/.config/zsh/custom/plugins

ln -s $HOME/.config/dotfiles/_shellconfig/zsh/zshrc $HOME/.config/zsh/.zshrc
ln -s $HOME/.config/dotfiles/_shellconfig/zsh/install.sh $HOME/.config/zsh/
ln -s $HOME/.config/dotfiles/_shellconfig/zsh/custom $HOME/.config/zsh/

touch $HOME/.hushlogin
