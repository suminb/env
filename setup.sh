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

echo -n "Enter your full name for git: "
read git_user_name
git config --global user.name "$git_user_name"

echo -n "Enter your email for git: "
read git_email
git config --global user.email "$git_email"

git config --global core.editor vim

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Use 256 colors
echo "export TERM=screen-256color" >> $HOME/.zshrc

# Make a symlink to .vimrc
pushd $HOME
ln -s $BASE_PATH/.vimrc
popd

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install my favoriate Vim theme (maui)
mkdir ~/.vim/colors
cp $BASE_PATH/maui.vim ~/.vim/colors/
