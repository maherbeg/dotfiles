#!/usr/bin/env bash

set -euo pipefail
shopt -s nullglob

# Ask for the administrator password upfront
# sudo -v

# Keep-alive: update existing `sudo` time stamp until script finishes
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Update all of our package lists
sudo apt-get update
sudo apt-get upgrade

if ! [ -x "$(command -v stow)" ]; then
	echo ">> Stow isn't installed, attempting to install!"
	sudo apt-get install stow
	echo ">> Stow installed!"
fi

sudo apt-get install fish git gnupg vim 

# TODO install ripgrep fd hyper node flow

if ! [-x "$(command -v node)" ]; then
    echo ">> Node isn't installed, attempting to install!"
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    sudo apt-get install -y nodejs
    # TODO maybe install buildtools
    echo ">> Node installed!"
fi

if ! [ -x "$(command -v code)" ]; then
  echo ">> Visual Studio Code isn't installed, attempting to install!"
  curl -L "https://go.microsoft.com/fwlink/?LinkID=760868" > /tmp/vscode.deb
  sudo apt install /tmp/vscode.deb
  rm /tmp/vscode.deb
  echo ">>Visual Studio Code installed!"
fi
