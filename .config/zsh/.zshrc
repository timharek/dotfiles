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

# ZSH
ZSH_THEME="robbyrussell"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

unset MAILCHECK

export EDITOR=nvim

source ~/.config/aliasrc
source ~/.config/functionrc

bindkey -v

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

task ready
