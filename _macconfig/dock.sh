#!/bin/bash
echo "==> Running dock.sh"

echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo "Set the icon size of Dock items to 25 pixels"
defaults write com.apple.dock tilesize -int 25

echo "Set the icon hover size of Dock items to 27 pixels"
defaults write com.apple.dock largesize -int 27

echo "Make Dock icons of hidden applications translucent"
defaults write com.apple.dock showhidden -bool true

echo "Disable hot corners"
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-br-corner -int 0

echo "Disable last recent applications"
defaults write com.Apple.Dock show-recents -bool false

echo "Dockutil configuration"
dockutil --remove all --no-restart
dockutil --add /Applications/Visual\ Studio\ Code.app --no-restart
dockutil --add /System/Applications/Mail.app --after Visual\ Studio\ Code --no-restart
dockutil --add /Applications/iTerm.app --after Mail --no-restart
dockutil --add /Applications/Firefox.app --after iTerm --no-restart
dockutil --add /Applications/Chromium.app --after Firefox --no-restart
dockutil --add /Applications/Slack.app --after Chromium --no-restart
dockutil --add /Applications/Spotify.app --after Slack --no-restart
