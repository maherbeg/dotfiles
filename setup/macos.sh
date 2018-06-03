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
