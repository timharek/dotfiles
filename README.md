# .-files

My dotfiles, mainly for my macOS setup.

## What I use

- OS: macOS 11 Big Sur
- Shell: [`zsh`](.config/zsh)
- Terminal: [iterm2](.config/iterm)
- Editors: [`nvim`](.config/nvim) & [VSCodium](vscodium)
- Browser: Firefox
- Package manager: [Homebrew](https://brew.sh) (`brew`)

## Setup

```sh
chmod +x macos
./macos
./homebrew/install.sh
ln -s ~/repos/dotfiles/.config ~/.config
ln -s ~/repos/dotfiles/.bin ~/.bin
ln -s ~/repos/dotfiles/.hammerspoon ~/.hammerspoon
ln -s ~/repos/dotfiles/vscodium/settings.json ~/Library/Application\ Support/VSCodium/User/settings.json
```

## Usage

### Homebrew

```sh
cd homebrew
chmod +x install.sh update.sh

./install.sh # To install brew formulas and casks
./update.sh # To update the lists `formulas` and `casks`
```

### NPM

```sh
cd npm
chmod +x install.sh update.sh

./install.sh # To install global npm packages
./update.sh # To update the list with global npm packages
```

### VSCodium

```sh
cd vscodium
chmod +x install.sh update.sh

./install.sh # To install extensions
./update.sh # To update the list of extensions
```
