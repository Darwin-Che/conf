#!/bin/bash

if [[ $(uname) = 'Linux' ]]; then
  echo "Please call this script in the conf/ folder, Thanks!"
  read

  CONF_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
  FONTS_DIR="$CONF_DIR/fonts"

  mkdir -p "$FONTS_DIR"

  pushd "$FONTS_DIR"

  if [[ ! -f Hack.zip ]]; then
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Hack.zip
    unzip Hack.zip
  fi

  if [[ $(which fc-cache) = '' ]]; then
    echo "fc-cache missing! Install fontconfig"
    sudo apt install fontconfig
  fi

  fc-cache .

  popd
elif [[ $(uname) = 'Darwin' ]]; then
  brew tap homebrew/cask-fonts
  brew install font-hack-nerd-font
fi

