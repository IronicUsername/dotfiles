#!/bin/bash
echo "==> Running oh_my_zsh.sh"

export ZSH=$HOME/.config/zsh/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing oh-my-zsh custom themes"
ln -s $HOME/.config/dotfiles/_shellconfig/oh_my_zsh/themes $HOME/.config/zsh/custom
