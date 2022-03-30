#!/bin/bash
echo "==> Running bootstrap.sh"

echo "Creating personal folder structure..."
export XDG_CONFIG_HOME="$HOME/.config"

mkdir -p $HOME/Development/{.archive,personal,notes,tools,sandbox,work/{sandbox}}
mkdir -p $HOME/.ssh
mkdir -p $XDG_CONFIG_HOME/{npm, vim}
mkdir -p $HOME/Music/SoundCloud/

ln -s $HOME/Music/SoundCloud $HOME/Downloads/music

echo "Cloning dotfiles repo..."
git clone https://github.com/IronicUsername/dotfiles.git $XDG_CONFIG_HOME/dotfiles

echo "Switch2dotfiles folder..."
cd $XDG_CONFIG_HOME/dotfiles
ln -s $XDG_CONFIG_HOME/dotfiles/_appconfig/npm/npmrc $XDG_CONFIG_HOME/npm/npmrc

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
mv -t .config .npm .tmux
rm .zcompdump*

source $XDG_CONFIG_HOME/zsh/.zshrc
echo "Done, enjoy :) (like i enjoyed your mom)"
