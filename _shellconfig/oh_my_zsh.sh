#!/bin/bash
echo "==> Running oh_my_zsh.sh"

export ZSH=$XDG_CONFIG_HOME/zsh/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing oh-my-zsh custom themes"
ln -s $XDG_CONFIG_HOME/dotfiles/_shellconfig/oh_my_zsh/themes $XDG_CONFIG_HOME/zsh/custom
