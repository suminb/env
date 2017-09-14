Install Oh My Zsh
---

    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

See https://github.com/robbyrussell/oh-my-zsh for more info.

Install Vundle
---

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

See https://github.com/VundleVim/Vundle.vim for more info.

Change Default Shell (in Ubuntu)
---

    chsh -s $(which zsh)

Miscellaneous Notes
---

### Asynchronous Lint Engine (ALE)

[ALE](https://github.com/w0rp/ale) requires either NeoVim or Vim version 8 or higher. However, Ubuntu 16.04 LTS comes with Vim 7 and ALE won't work with it. Vim 8 can be obtained as follows:

    sudo add-apt-repository ppa:pi-rho/dev
    sudo apt update
    sudo apt install vim
    
Then add the following line in `.vimrc` to enable the plugin.

    Plugin 'w0rp/ale'

### Vim Cheatsheets

(Not sure if this is a good place for this kind of notes, but we'll put it here for now)

#### Search

    /pattern
    
#### Search in `*.py` files

    :vim /pattern/ **/*.py

#### Close all splits but the current one

    :only

#### Close all tabs but the current one

    :tabonly
