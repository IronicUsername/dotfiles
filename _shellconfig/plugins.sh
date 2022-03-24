#!/bin/bash
echo "==> Running plugins.sh"

git clone https://github.com/zsh-users/zsh-autosuggestions $XDG_CONFIG_HOME/zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/djui/alias-tips.git $XDG_CONFIG_HOME/zsh/custom/plugins/alias-tips
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $XDG_CONFIG_HOME/zsh/custom/plugins/zsh-syntax-highlighting
