#!/bin/bash

HOST=$(uname)

if [[ $(which nvim) = '' ]]; then
	echo "Installing Neovim"
	if [[ $HOST = 'Linux' ]]; then
		curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
		chmod u+x nvim.appimage
		./nvim.appimage --appimage-extract
		sudo mv squashfs-root /
		sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
	else
		brew install neovim
	fi
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
NVIM_CONF_DIR="${SCRIPT_DIR}/nvim"

# Install NVChad
if [[ ! -d "$NVIM_CONF_DIR" ]]; then
	mkdir -p "$NVIM_CONF_DIR"
	git clone https://github.com/NvChad/NvChad "$NVIM_CONF_DIR" --depth 1
fi

mkdir -p ~/.config
if [[ ! -f ~/.config/nvim ]] && [[ ! -d ~/.config/nvim ]]; then
	ln -s $NVIM_CONF_DIR ~/.config
else
	echo "~/.config/nvim/ already exists"
fi

ENABLE_NVIM='alias vim=nvim'

if grep -q "$ENABLE_NVIM" ~/.zshrc; then
	echo "zshrc already has $ENABLE_NVIM"
else
	echo "writing $ENABLE_NVIM to zshrc"
	echo 'alias vim=nvim' >> ~/.zshrc
	echo "finished writing $ENABLE_NVIM to zshrc"
fi

if grep -q "$ENABLE_NVIM" ~/.bashrc; then
	echo "bashrc already has $ENABLE_NVIM"
else
	echo "writing $ENABLE_NVIM to bashrc"
	echo 'alias vim=nvim' >> ~/.bashrc
	echo "finished writing $ENABLE_NVIM to bashrc"
fi

