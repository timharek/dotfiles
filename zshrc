# Path to your oh-my-zsh installation.
if [[ "$(uname)" == "Darwin" ]]; then
    export ZSH="/Users/tim/.oh-my-zsh"
elif [[ "$(uname)" == "Linux" ]]; then
    export ZSH="~/.oh-my-zsh"
else
    echo "Unknown OS, cannot locate ZSH"
fi

ZSH_THEME="robbyrussell"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

unset MAILCHECK

export EDITOR=vim
export VISUAL=nova

REPOS="~/dev/repos"
UIB="$REPOS/UiB"

source ~/.config/.aliasrc
source ~/.config/.functionrc

export PATH="$HOME/.radicle/bin:$PATH"
bindkey -v

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

