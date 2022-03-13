#!/bin/bash
echo "==> Running plugins.sh"

git clone https://github.com/romkatv/powerlevel10k.git $HOME/.zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/djui/alias-tips.git $HOME/.zsh/custom/plugins/alias-tips
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/custom/plugins/zsh-syntax-highlighting
