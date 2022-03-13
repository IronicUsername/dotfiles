#!/bin/bash
echo "==> Running main.sh"
export COMPUTER_NAME="deniz"

echo "Doing Brewfiles (and your mom ;])"
./brew.sh

echo "Accept Xcode license"
sudo xcodebuild -license accept

osascript -e 'tell application "System Preferences" to quit'

echo "Admin login. Ask for the administrator password upfront."
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Setting up UI/UX..."
./ui.sh

echo "Setting up Dock..."
./dock.sh

echo "Setting up Finder..."
./finder.sh

echo "Setting up software updates..."
./updates.sh

echo "Setting symlinks..."
./symlinks.sh
