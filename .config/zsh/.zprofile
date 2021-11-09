export GPG_TTY=$(tty)

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tim/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine

# Ruby bundler
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle 
BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle

# Ruby gem
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# MySQL
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history 

# Rust 
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# Go
export GOPATH="$XDG_DATA_HOME"/go

# Python
export PYLINTHOME="$XDG_CACHE_HOME"/pylint

# Less
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm

# Composer
export PATH="$PATH:~/.config/composer/vendor/bin"
