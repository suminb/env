#!/bin/bash

# Exit when any command fails
set -e

command_exists() {
    which "$1" &> /dev/null
}

pushd $(dirname $0)
BASE_PATH=$(pwd)
popd

brew update

if ! command_exists zsh; then
    brew install zsh

    # Change the default shell
    chsh -s $(which zsh)
fi

echo "Install system utilities"
brew install curl git vim ripgrep tmux

echo -n "Enter your full name for git: "
read git_user_name
git config --global user.name "$git_user_name"

echo -n "Enter your email for git: "
read git_email
git config --global user.email "$git_email"

git config --global core.editor vim
git config --global push.default simple
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Install Oh My Zsh
#
# RUNZSH=no prevents running the shell after installation, so that the rest of
# the installation continues.
# CHSH=no prevents the script asking whether we want to change the default
# shell to zsh.
#
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

# Use 256 colors
echo "export TERM=screen-256color" >> $HOME/.zshrc

# Make a symlink to .vimrc
pushd $HOME
ln -s $BASE_PATH/.vimrc
popd

echo "Install my favoriate Vim theme (maui)"
mkdir -p $HOME/.vim/colors
cp $BASE_PATH/maui.vim ~/.vim/colors/

echo "Install Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Required to build YouCompleteMe plugin for vim
brew install cmake
vim +PluginInstall +qall
python $HOME/.vim/bundle/YouCompleteMe/install.py

