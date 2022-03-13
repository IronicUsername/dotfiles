#!/bin/bash
echo "==> Running bootstrap.sh"

echo "Creating folders..."
mkdir -p $HOME/Development/.archive
mkdir -p $HOME/Development/personal
mkdir -p $HOME/Development/notes
mkdir -p $HOME/Development/tools
mkdir -p $HOME/Development/sandbox
mkdir -p $HOME/Development/work/sandbox
mkdir -p $HOME/.ssh
mkdir -p $HOME/Music/soundcloud/
ln -s $HOME/Music/soundcloud $HOME/Downloads/music

echo "Cloning dotfiles repo..."
mkdir -p $HOME/.config/dotfiles
git clone https://github.com/IronicUsername/dotfiles.git $HOME/.config/dotfiles

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected Mac OSX system."
    read -p "Continue with macconfig steps?" -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "continuing with macconfig..."
        ./_macconfig/main.sh
    else
        echo "continuing with linux/unix steps..."
        ./_unixconfig/main.sh
    fi
fi

echo "Setting up ssh..."
./_sshconfig/main.sh
