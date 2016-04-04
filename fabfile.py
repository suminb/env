from fabric.api import prompt, run, sudo, warn_only
from fabric.context_managers import cd
from fabric.contrib.files import exists


def setup():
    sudo('apt-get update && apt-get upgrade -y')
    sudo('apt-get install -y git git-flow tmux ack-grep')
    sudo('apt-get install -y python-pip python-dev python-virtualenv')
    sudo('apt-get install -y libffi-dev libpq-dev cmake')

    with warn_only():
        git_username = run('git config user.name')
    if not git_username:
        git_username = prompt('Enter your full name for git: ')
        run('git config --global user.name "{}"'.format(git_username))

    with warn_only():
        git_email = run('git config user.email')
    if not git_email:
        git_email = prompt('Enter your email for git: ')
        run('git config --global user.email "{}"'.format(git_email))

    run('git config --global core.editor vim')
    run('git config --global push.default simple')
    run('git config --global alias.lg "log --color --graph '
        '--pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s '
        '%Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit"')

    if not exists('env'):
        run('git clone https://github.com/suminb/env.git')

    sudo('apt-get install -y zsh')
    with warn_only():
        run('sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"')
    # sudo('sed -i \'1s/^/auth       sufficient   pam_wheel.so trust group=chsh\n/g\' /etc/pam.d/chsh')
    # sudo('groupadd chsh')
    # run('usermod -a -G chsh ubuntu')
    # sudo('chsh -s /usr/bin/zsh ubuntu')

    with warn_only():
        term_color = run('cat $HOME/.zshrc | grep "TERM=screen-256color"')
    if not term_color:
        run('echo "export TERM=screen-256color" >> $HOME/.zshrc')

    if exists('.vimrc'):
        run('mv .vimrc .vimrc.bak')
    run('ln -s env/.vimrc')
    run('mkdir -p .vim/colors')
    run('cp env/maui.vim .vim/colors/')

    if not exists('$HOME/.vim/bundle/Vundle.vim'):
        run('git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim')
        run('vim +PluginInstall +qall')
        run('.vim/bundle/YouCompleteMe/install.py')
        sudo('pip install isort')

    with warn_only():
        workon_home = run('cat $HOME/.zshrc | grep "export WORKON_HOME"')
    if not workon_home:
        sudo('pip install virtualenvwrapper')
        run('echo "export WORKON_HOME=$HOME/.virtualenvs" >> $HOME/.zshrc')
        # run('export PROJECT_HOME=$HOME/dev')
        run('source /usr/local/bin/virtualenvwrapper.sh')
