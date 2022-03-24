#!/bin/bash
current_relative_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
echo "==> Running main.sh"


ln -s $XDG_CONFIG_HOME/dotfiles/_shellconfig/zsh/zshenv $HOME/.zshenv

echo "Installing oh-my-zsh..."
$current_relative_path/oh_my_zsh.sh

echo "Setting up zsh..."
$current_relative_path/zsh.sh


echo "Installing tmux themes, addons and settings..."
git clone https://github.com/jimeh/tmux-themepack.git $XDG_CONFIG_HOME/tmux-themepack  # todo
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm  # todo
ln -s $XDG_CONFIG_HOME/dotfiles/_shellconfig/zsh/.tmux.conf $HOME/.tmux.conf

echo "Installing zsh plugins..."
$current_relative_path/plugins.sh
ln -s $XDG_CONFIG_HOME/dotfiles/_shellconfig/zsh/install.sh $XDG_CONFIG_HOME/zsh/install.sh

echo "Installing iTerm2 Shell Integration..."
curl -sL https://iterm2.com/shell_integration/zsh > $XDG_CONFIG_HOME/zsh/custom/plugins/iterm2/.iterm2_shell_integration.zsh
ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/iterm/ $XDG_CONFIG_HOME/iterm2  # todo

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

echo "Linking inputrc"
ln -s $XDG_CONFIG_HOME/dotfiles/_shellconfig/readline $XDG_CONFIG_HOME/
