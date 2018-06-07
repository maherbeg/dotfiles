#!/usr/bin/env bash

set -euo pipefail
shopt -s nullglob

if ! [ -x "$(xcode-select -p)" ]; then
	echo ">> Installing XCode Tools"
	xcode-select --install
	echo ">> XCode Tools installed!"
fi

if ! [ -x "$(command -v brew)" ]; then
	echo ">> Homebrew isn't installed, attempting to install!"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	echo ">> Homebrew installed!"
fi

brew update

if ! [ -x "$(command -v stow)" ]; then
	echo ">> Stow isn't installed, attempting to install!"
	brew install stow
	echo ">> Stow installed!"
fi

echo ">> Stowing brew"
stow brew
echo ">> Brew stored!"

echo ">> Installing and upgrading dependencies from brew file"
# brew bundle install --global
brew upgrade
echo ">> Brew bundles installed!"

# Many pieces courtesy of https://github.com/mihaliak/dotfiles/blob/master/macos/defaults.sh
echo ">> Updating MacOS default preferences"
COMPUTER_NAME="Bender"
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "$COMPUTER_NAME"
sudo scutil --set HostName "$COMPUTER_NAME"
sudo scutil --set LocalHostName "$COMPUTER_NAME"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$COMPUTER_NAME"

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
echo ">> MacOS default preferences set"
