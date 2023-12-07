#!/bin/bash

set -x
set -e

sudo apt-get update
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen -y

if ! [[ -d $HOME/build/neovim ]]; then
	git clone https://github.com/neovim/neovim ~/build/neovim
	cd ~/build/neovim
	make
	sudo make install
fi

if ! [[ -x "$(command -v cargo)" ]]; then
	curl https://sh.rustup.rs -sSf | sh
fi

if ! [[ -x "$(command -v zsh)" ]]; then
	sudo apt-get install zsh -y
	chsh -s $(which zsh)
fi

cargo install \
    ripgrep
