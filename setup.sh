#!/bin/bash

command_exists() {
    which "$1" &> /dev/null
}

pushd $(dirname $0)
BASE_PATH=$(pwd)
popd

if ! command_exists zsh; then
    sudo apt install -y zsh

    # Change the default shell
    chsh -s $(which zsh)
fi

echo "Install system utilities"
RIPGREP_VERSION="0.10.0"
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/ripgrep_0.10.0_amd64.deb
sudo dpkg -i ripgrep_${RIPGREP_VERSION}_amd64.deb
sudo apt install -y curl git vim

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

echo "Install my favoriate Vim theme (maui)"
mkdir -p $HOME/.vim/colors
cp $BASE_PATH/maui.vim ~/.vim/colors/

echo "Install Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Required to build YouCompleteMe plugin for vim
sudo apt install -y cmake
vim +PluginInstall +qall
python $HOME/.vim/bundle/YouCompleteMe/install.py

echo "Install Couchbase libraries"
curl http://packages.couchbase.com/ubuntu/couchbase.key | sudo apt-key add -
sudo curl http://packages.couchbase.com/ubuntu/couchbase-ubuntu1204.list > \
    /etc/apt/sources.list.d/couchbase.list
sudo apt update
sudo apt install -y libcouchbase2-libevent libcouchbase-dev

echo "Install other necessary libraries & programs"
sudo apt install -y python-dev python-pip python-virtualenv
sudo apt install -y libffi-dev libpq-dev
sudo pip install isort
