#!/bin/bash
echo "==> Running update.sh"

echo "Enable the automatic update check"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

echo "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -bool true

echo "Download newly available updates in background"
defaults write com.apple.SoftwareUpdate AutomaticDownload -bool true

echo "Install System data files & security updates"
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -bool true

echo "Turn on app auto-update"
defaults write com.apple.commerce AutoUpdate -bool true

for app in "Dock" "Finder" "Mail" "Safari" "SystemUIServer"; do
    killall "${app}" &> /dev/null
done
