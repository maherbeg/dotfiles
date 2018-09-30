#!/usr/bin/env bash

# Portability and safety concerns
# https://github.com/anordal/shellharden/blob/7a5a3d64f4e2e0b43d63a3f8cabf12bc2eaa675b/how_to_do_things_safely_in_bash.md
set -euo pipefail
shopt -s nullglob

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	echo "Run Linux instructions"
	./setup/linux.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
	echo "Run MacOS install setup"
	./setup/macos.sh
else
	echo "$OSTYPE is not a supported install target! Oh well!" >&2
	exit 1
fi

if ! grep --quiet "$(command -v fish)" /etc/shells ; then
  echo "Installing fish into /etc/shells"
  command -v fish | sudo tee -a /etc/shells 
fi

echo "Changing shell to fish"
sudo usermod -s "$(command -v fish)" "${USER}"

echo "Installing stow configuration <whoaa>"
stow stow
echo "Stow configuration installed!"

echo "Installing fish configuration!"
stow fish
echo "Fish configuration installed!"

echo "Installing git configuration!"
stow git
echo "Git configuration installed!"

echo "Installing hyper configuration!"
stow hyper
echo "Hyper configuration installed!"

echo "Installing vim configuration!"
stow vim
echo "Vim configuration installed!"

echo "Installing Rust Lang"
if ! [[ -x "$(command -v rustc)" ]]; then
	curl https://sh.rustup.rs -sSf | sh -s -- -y
fi

$(command -v fish) -c "~/.cargo/bin/rustup update"
$(command -v fish) -c "~/.cargo/bin/rustup completions fish"
echo "Rust installed!"

echo "Installing Global NPM Tools"
npm install -g \
  create-react-app \
	yarn
echo "NPM Tools installed!"
