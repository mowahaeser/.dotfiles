#!/bin/bash

set -x
set -e

# Update Repositories 
 sudo apt-get update

# Install Dependecies
 sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen -y

# Build and Install Neovim
if ! [[ -d $HOME/build/neovim ]]; then
	git clone https://github.com/neovim/neovim ~/build/neovim
	cd ~/build/neovim
	make
	sudo make install
fi

# Install Cargo
if ! [[ -x "$(command -v cargo)" ]]; then
	curl https://sh.rustup.rs -sSf | sh
fi

# Install Zsh
if ! [[ -x "$(command -v zsh)" ]]; then
	sudo apt-get install zsh -y
	chsh -s $(which zsh)
fi
