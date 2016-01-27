#!/bin/bash

command_exists() {
    which "$1" &> /dev/null
}

pushd $(dirname $0)
BASE_PATH=$(pwd)
popd

if ! command_exists zsh; then
    sudo apt-get install -y zsh

    # Change the default shell
    chsh -s $(which zsh)
fi
if ! command_exists git; then
    sudo apt-get install -y git
fi

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Make a symlink to .vimrc
pushd $HOME
ln -s $BASE_PATH/.vimrc
popd

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install my favoriate Vim theme (maui)
mkdir ~/.vim/colors
cp $BASE_PATH/maui.vim ~/.vim/colors/
