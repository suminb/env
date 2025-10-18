# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/opt/libpq/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

DISABLE_UPDATE_PROMPT=true

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

export LC_ALL="en_US.UTF-8"
export EDITOR="vim"

alias rm.pyc="find . -name '*.pyc' -delete -print"
alias rm.stopped-containers='docker rm $(docker ps -a -q)'
alias rm.untagged-images='docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")'
alias rm.dangling-volumes='docker volume ls -qf dangling=true | xargs -r docker volume rm'
alias rm.merged-branches="git branch --merged | egrep -v '(^\*|master|dev)' | xargs git branch -d"
alias pt="ptpython --vi"
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Use 256 colors
export TERM=screen-256color

# Lazy load pyenv
pyenv() {
  unfunction pyenv
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(command pyenv init -)"
  eval "$(command pyenv virtualenv-init -)"
  pyenv "$@"
}

# Lazy load pyenv-virtualenv
pyenv-virtualenv() {
  unfunction pyenv-virtualenv
  eval "$(command pyenv virtualenv-init -)"
  pyenv-virtualenv "$@"
}

# # tabtab source for serverless package
# # uninstall by removing these lines or running `tabtab uninstall serverless`
# # [[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# # tabtab source for sls package
# # uninstall by removing these lines or running `tabtab uninstall sls`
# # [[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

export HELM_PATH=/usr/local/bin
export PATH=$HELM_PATH:$PATH
export KUBERNETES_CLI_PATH=/usr/local/bin
export PATH=$KUBERNETES_CLI_PATH:$PATH
export NCC_CLI_PATH=/usr/local/bin
export PATH=$NCC_CLI_PATH:$PATH
export DOCKER_PATH=/usr/local/bin
export PATH=$DOCKER_PATH:$PATH
export PATH="/usr/local/opt/libpq/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# WTF is this shit?
fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select

# >>> c3 cli: cx
export PATH="/Users/sb/.local/bin":$PATH

# NodeJS
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
