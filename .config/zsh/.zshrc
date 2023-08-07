# Path to your oh-my-zsh installation.
if [[ "$(uname)" == "Darwin" ]]; then
    export ZSH="/Users/timharekandreassen/.oh-my-zsh"
    export PATH="$HOME/.bin:$PATH"
elif [[ "$(uname)" == "Linux" ]]; then
    export ZSH="/home/timharekandreassen/.oh-my-zsh"
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
plugins=(git zsh-syntax-highlighting zsh-autosuggestions fzf-zsh-plugin)
source $ZSH/oh-my-zsh.sh

unset MAILCHECK

export EDITOR=hx

source ~/.config/aliasrc
source ~/.config/functionrc
source $XDG_CONFIG_HOME/zsh/.secret

bindkey -v

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

task ready

# Google Cloud SDK stuff for work
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/timharekandreassen/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/timharekandreassen/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/timharekandreassen/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/timharekandreassen/google-cloud-sdk/completion.zsh.inc'; fi
