#!/bin/bash
echo "==> Running oh_my_zsh.sh"

export ZSH=$HOME/.zsh/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing oh-my-zsh custom themes"
ln -s $HOME/.config/dotfiles/_shellconfig/oh_my_zsh/themes $HOME/.zsh/custom
# ln -s $HOME/.config/dotfiles/_shellconfig/oh_my_zsh/themes/agnoster-custom.zsh-theme $HOME/.zsh/custom/themes/
# ln -s $HOME/.config/dotfiles/_shellconfig/oh_my_zsh/themes/agnoster-custom-server.zsh-theme $HOME/.zsh/custom/themes/
