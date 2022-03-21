#!/bin/bash
echo "==> Running main.sh"

echo "Setting up vscode packages..."
xargs -n 1 code --install-extension < $HOME/.config/dotfiles/_appconfig/vscode/extensions.txt
