if status is-interactive
    # Commands to run in interactive sessions can go here
end

# fish
set fish_greeting
export EDITOR=hx
export PAGER="bat -p"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export BAT_THEME="OneHalfDark"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Go
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export PATH="$PATH:$GOPATH/bin"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"

# Ruby bundler
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
set BUNDLE_USER_CACHE "$XDG_CACHE_HOME/bundle"
set BUNDLE_USER_PLUGIN "$XDG_DATA_HOME/bundle"

# Ruby gem
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# MySQL
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"

# Rust 
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# Python
export PYLINTHOME="$XDG_CACHE_HOME/pylint"

# Less
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# Composer
export PATH="$PATH:~/.config/composer/vendor/bin"

# Yarn
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# Deno
export DENO_INSTALL_ROOT="$XDG_CONFIG_HOME/deno"
export DENO_DIR="$XDG_CACHE_HOME/deno"
export PATH="$XDG_CONFIG_HOME/deno/bin:$PATH"

# Homebrew 
export PATH="/opt/homebrew/bin:$PATH"
export HOMEBREW_BUNDLE_FILE="$XDG_CONFIG_HOME/brew/Brewfile"
eval "$(brew shellenv)"

# Java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Volta (like nvm)
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export PATH="$HOME/.bin:$PATH"

starship init fish | source

source ~/.config/aliasrc
source ~/.config/functionrc

op completion fish | source
yr completion fish | source
migadu completion fish | source
art completion fish | source
docker completion fish | source

direnv hook fish | source
direnv export fish | source
