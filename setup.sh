#!/bin/bash

BASE_PATH=$(dirname $0)

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install my favoriate Vim theme (maui)
mkdir ~/.vim/colors
cp $BASE_PATH/maui.vim ~/.vim/colors/
