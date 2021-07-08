# Path to your oh-my-zsh installation.
if [[ "$(uname)" == "Darwin" ]]; then
    export ZSH="/Users/tim/.oh-my-zsh"
    export PATH="$HOME/.bin:$PATH"
elif [[ "$(uname)" == "Linux" ]]; then
    export ZSH="/home/tim/.oh-my-zsh"
    PROMPT="$fg[cyan]%}$USER@%{$fg[blue]%}%m ${PROMPT}"

    if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	    	  exec startx
    fi
else
    echo "Unknown OS, cannot locate ZSH"
fi

ZSH_THEME="robbyrussell"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

unset MAILCHECK

export EDITOR=nvim

REPOS="~/dev/repos"
UIB="~/Utdanning/uib/"

source ~/.config/aliasrc
source ~/.config/functionrc

bindkey -v

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


source /Users/tim/.config/broot/launcher/bash/br
