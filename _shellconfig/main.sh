#!/bin/bash
current_relative_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
echo "==> Running main.sh"

echo "Linking stuff"
ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/aws $XDG_CONFIG_HOME/aws
ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/python $XDG_CONFIG_HOME/python
ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/sc-im $XDG_CONFIG_HOME/sc-im
ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/vim/vimrc $XDG_CONFIG_HOME/vim/vimrc
ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/zsh/zshenv $HOME/.zshenv

echo "Setting up nVim..."
echo "TODO"
# git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
# ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/nvim $XDG_CONFIG_HOME/nvim

echo "Link gitconfig"
ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/git $XDG_CONFIG_HOME/git
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

echo "Linking inputrc"
ln -s $XDG_CONFIG_HOME/dotfiles/_shellconfig/readline $XDG_CONFIG_HOME/

echo "Installing oh-my-zsh..."
$current_relative_path/oh_my_zsh.sh

echo "Setting up zsh..."
$current_relative_path/zsh.sh

echo "Installing tmux themes, addons and settings..."
mv $HOME/.tmux $XDG_CONFIG_HOME/tmux
git clone https://github.com/jimeh/tmux-themepack.git $XDG_CONFIG_HOME/tmux/tmux-themepack  # todo
git clone https://github.com/tmux-plugins/tpm $XDG_CONFIG_HOME/tmux/plugins/tpm  # todo
ln -s $XDG_CONFIG_HOME/dotfiles/_shellconfig/tmux/tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf

echo "Installing zsh plugins..."
$current_relative_path/plugins.sh
ln -s $XDG_CONFIG_HOME/dotfiles/_shellconfig/zsh/install.sh $XDG_CONFIG_HOME/zsh/install.sh

echo "Installing iTerm2 Shell Integration..."
mkdir -p $XDG_CONFIG_HOME/zsh/custom/plugins/iterm2
curl -sL https://iterm2.com/shell_integration/zsh > $XDG_CONFIG_HOME/zsh/custom/plugins/iterm2/.iterm2_shell_integration.zsh
ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/iterm/ $XDG_CONFIG_HOME/iterm2  # todo

echo "Installing powerline fonts..."
git clone https://github.com/powerline/fonts.git
(
    cd fonts
    ./install.sh
)
rm -rf fonts
