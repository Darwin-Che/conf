#!/bin/bash

function chkreq {
	which $1
	if [[ $? -ne 0 ]]; then
		echo "$1 is not installed."
		echo "Please install $1 first."
		exit 1
	fi
}

# chkreq zsh
chkreq git
chkreq vim

#echo "# Making zsh default shell"
#chsh -s $(which zsh)

echo "# Setting up vim plugins"

mkdir -p ~/.vim

pushd ~/.vim
mkdir -p autoload
mkdir -p bundle

echo "## Installing Pathogen"

pushd autoload
if [[ ! -d pathogen.vim ]]; then
    curl --insecure -LSso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
fi
popd

echo "## Installing buftabline"

pushd bundle
if [[ ! -d vim-buftabline ]]; then
    git clone https://github.com/ap/vim-buftabline
fi
popd

echo "## Installing Nerdtree"

pushd bundle
if [[ ! -d nerdtree ]]; then
	git clone https://github.com/preservim/nerdtree
fi
popd

echo "## Installing material.vim"

pushd bundle
if [[ ! -d material.vim ]]; then
    git clone https://github.com/kaicataldo/material.vim
fi
popd

echo "# Finish vim plugins"

popd



