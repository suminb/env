#!/bin/bash

command_exists() {
    which "$1" &> /dev/null
}

BASE_PATH=$(dirname $0)

if ! command_exists zsh; then
    sudo apt-get install -y zsh
fi
if ! command_exists git; then
    sudo apt-get install -y git
fi

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install my favoriate Vim theme (maui)
mkdir ~/.vim/colors
cp $BASE_PATH/maui.vim ~/.vim/colors/
