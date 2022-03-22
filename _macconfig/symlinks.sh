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
ln -s $HOME/.config/dotfiles/_appconfig/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -s $HOME/.config/dotfiles/_appconfig/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
ln -s $HOME/.config/dotfiles/_appconfig/vscode/snippets $HOME/Library/Application\ Support/Code/User

symlinkFilesTo vscode "${HOME}/Library/Application Support/Code/User"

# Done
echo "--> Done!"

# Unset
unset getFilesInDir
unset symlinkFilesTo

# if [ -f "$HOME/.zshrc.pre-oh-my-zsh" ]; then
#   # echo "source ~/.zshrc.pre-oh-my-zsh" >> $HOME/.zshrc
#   cat ~/.zshrc.pre-oh-my-zsh > ~/.zshrc
# fi
