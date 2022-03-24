#!/bin/bash
echo "==> Running main.sh"

echo "Setting up vscode packages..."
xargs -n 1 code --install-extension < $XDG_CONFIG_HOME/dotfiles/_appconfig/vscode/extensions.txt
