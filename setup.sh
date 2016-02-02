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
git config --global push.default simple
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Use 256 colors
echo "export TERM=screen-256color" >> $HOME/.zshrc

# Make a symlink to .vimrc
pushd $HOME
ln -s $BASE_PATH/.vimrc
popd

echo "Install Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Required to build YouCompleteMe plugin for vim
sudo apt-get install -y cmake
vim +PluginInstall +qall

echo "Install my favoriate Vim theme (maui)"
mkdir ~/.vim/colors
cp $BASE_PATH/maui.vim ~/.vim/colors/

echo "Install Couchbase libraries"
wget -O- http://packages.couchbase.com/ubuntu/couchbase.key | sudo apt-key add - 
sudo wget -O/etc/apt/sources.list.d/couchbase.list \
        http://packages.couchbase.com/ubuntu/couchbase-ubuntu1204.list
sudo apt-get update
sudo apt-get install -y libcouchbase2-libevent libcouchbase-dev

echo "Install other necessary libraries & programs"
sudo apt-get install -y python-dev python-pip python-virtualenv
sudo apt-get install -y libffi-dev libpq-dev
sudo apt-get install -y git-flow ack-grep
