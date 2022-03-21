#!/bin/bash
echo "==> Running bootstrap.sh"

echo "Creating personal folder structure..."
mkdir -p $HOME/Development/{.archive,personal,notes,tools,sandbox,work/{sandbox}}
mkdir -p $HOME/.ssh
mkdir -p $HOME/.config
mkdir -p $HOME/Music/SoundCloud/
ln -s $HOME/Music/SoundCloud $HOME/Downloads/music

echo "Cloning dotfiles repo..."
git clone https://github.com/IronicUsername/dotfiles.git $HOME/.config/dotfiles

echo "Switch2dotfiles folder..."
cd $HOME/.config/dotfiles

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected Mac OSX system. Continuing with macconfig..."
    ./_macconfig/main.sh
else
    echo "Continuing with linux/unix steps..."
    ./_unixconfig/main.sh
fi

echo "Setting up shell..."
./_shellconfig/main.sh

echo "Setting up python in general..."
./_pythonconfig/main.sh

echo "Setting up ssh..."
./_sshconfig/main.sh

echo "Settings up apps..."
./_appconfig/main.sh

echo "Cleanup..."
mv -t .config .npm .nvm .tmux
rm .zcompdump*

source $HOME/.config/zsh/.zshrc
echo "Done, enjoy :) (like i enjoyed your mom)"