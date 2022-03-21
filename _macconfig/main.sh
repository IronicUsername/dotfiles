#!/bin/bash
echo "==> Running main.sh"

export COMPUTER_NAME="deniz"
current_relative_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

echo "Doing Brewfiles (and your mom ;])"
$current_relative_path/brew.sh

echo "Setting up in general python"
$current_relative_path/../_pythonconfig/main.sh

echo "Accept Xcode license"
sudo xcodebuild -license accept

osascript -e 'tell application "System Preferences" to quit'

echo "Admin login. Ask for the administrator password upfront."
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Setting up UI/UX..."
$current_relative_path/ui.sh

echo "Setting up Dock..."
$current_relative_path/dock.sh

echo "Setting up Finder..."
$current_relative_path/finder.sh

echo "Setting up software updates..."
$current_relative_path/updates.sh

echo "Setting symlinks..."
$current_relative_path/symlinks.sh
