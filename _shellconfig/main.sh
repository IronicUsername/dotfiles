#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
echo "==> Running main.sh"

echo "Setting up zsh..."
$parent_path/zsh.sh

echo "Installing oh-my-zsh..."
$parent_path/oh_my_zsh.sh

echo "Installing zsh plugins..."
$parent_path/plugins.sh

echo "Installing iTerm2 Shell Integration..."
curl -sL https://iterm2.com/shell_integration/zsh > $HOME/.iterm2_shell_integration.zsh
ln -s $HOME/.config/dotfiles/_appconfig/iterm/ $HOME/.mypref/iterm2  # todo

echo "Installing tmux themes and addons..."
git clone https://github.com/jimeh/tmux-themepack.git $HOME/.config/tmux-themepack  # todo
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm  # todo

echo "Installing powerline fonts..."
git clone https://github.com/powerline/fonts.git
(
    cd fonts
    ./install.sh
)
rm -rf fonts

echo "Make git use diff-so-fancy for every output"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
