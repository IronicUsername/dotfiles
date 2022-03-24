#!/bin/bash
echo "==> Running zsh.sh"

mkdir -p $XDG_CONFIG_HOME/zsh/completions
mkdir -p $XDG_CONFIG_HOME/zsh/custom/plugins

ln -s $XDG_CONFIG_HOME/dotfiles/_shellconfig/zsh/zshrc $XDG_CONFIG_HOME/zsh/.zshrc
ln -s $XDG_CONFIG_HOME/dotfiles/_shellconfig/zsh/install.sh $XDG_CONFIG_HOME/zsh/
ln -s $XDG_CONFIG_HOME/dotfiles/_shellconfig/zsh/custom $XDG_CONFIG_HOME/zsh/

touch $HOME/.hushlogin
