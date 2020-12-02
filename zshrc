# Path to your oh-my-zsh installation.
export ZSH="/Users/tim/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

unset MAILCHECK

export EDITOR=nano
export VISUAL=nova

REPOS="/Users/tim/Repositories"
UIB="/Users/tim/Repositories/UiB"

source /Users/tim/.config/.aliasrc

function tull() {
	if [ -z "$1" ]
	    then
		echo "Tulling!"
	else
		echo "Fuckings $1"
	fi
}
