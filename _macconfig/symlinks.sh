#!/bin/bash
echo "==> Running symlinks.sh"

# Gets a list of files
function getFilesInDir() {
    find "$1" ! -path ./.DS_Store -name '*.*'
}

# $1 directory to search for files
# $2 destination of symlink
function symlinkFilesTo() {
for F in $(getFilesInDir "$1"); do
    # Make symlink
    cleanPath=$(echo "$F" | sed 's,^[^/]*/,,')
    echo "- ${2}/${cleanPath} -> ${1}/${cleanPath}"
    ln -sfn "${PWD}/${1}/${cleanPath}" "${2}/${cleanPath}"
    done
}

# Home files
echo "--> home symlinks.."
symlinkFilesTo home "${HOME}"

# vscode
echo "--> VSCode symlinks..."
mkdir -p /Applications/code-portable-data/user-data/User/
rmdir /Applications/code-portable-data/user-data/User/snippets
ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/vscode/settings.json /Applications/code-portable-data/user-data/User/settings.json
ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/vscode/keybindings.json /Applications/code-portable-data/user-data/User/keybindings.json
ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/vscode/snippets /Applications/code-portable-data/user-data/User/

symlinkFilesTo vscode "${HOME}/Library/Application Support/Code/User"

# Unset
unset getFilesInDir
unset symlinkFilesTo

# if [ -f "$HOME/.zshrc.pre-oh-my-zsh" ]; then
#   # echo "source ~/.zshrc.pre-oh-my-zsh" >> $HOME/.zshrc
#   cat ~/.zshrc.pre-oh-my-zsh > ~/.zshrc
# fi
