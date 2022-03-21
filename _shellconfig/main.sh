#!/bin/bash
current_relative_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
echo "==> Running main.sh"


ln -s $HOME/.config/dotfiles/_shellconfig/zsh/zshenv $HOME/.zshenv

echo "Installing oh-my-zsh..."
$current_relative_path/oh_my_zsh.sh

echo "Setting up zsh..."
$current_relative_path/zsh.sh


echo "Installing tmux themes, addons and settings..."
git clone https://github.com/jimeh/tmux-themepack.git $HOME/.config/tmux-themepack  # todo
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm  # todo
ln -s $HOME/.config/dotfiles/_shellconfig/zsh/.tmux.conf $HOME/.tmux.conf

echo "Installing zsh plugins..."
$current_relative_path/plugins.sh
ln -s $HOME/.config/dotfiles/_shellconfig/zsh/install.sh $HOME/.config/zsh/install.sh

echo "Installing iTerm2 Shell Integration..."
curl -sL https://iterm2.com/shell_integration/zsh > $HOME/.iterm2_shell_integration.zsh
ln -s $HOME/.config/dotfiles/_appconfig/iterm/ $HOME/.config/iterm2  # todo

echo "Installing powerline fonts..."
git clone https://github.com/powerline/fonts.git
(
    cd fonts
    ./install.sh
)
rm -rf fonts

echo "Link gitconfig"
ln -s $current_relative_path/zsh/.gitconfig $HOME/.gitconfig
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
