[![builds.sr.ht status](https://builds.sr.ht/~timharek/dotfiles/commits/main/.build.yml.svg)](https://builds.sr.ht/~timharek/dotfiles/commits/main/.build.yml?)

# dotfiles

My dotfiles for my macOS setup.

## What I use

- Shell: [`fish`](.config/fish)
- Terminal: [Ghostty](.config/ghostty/config)
- Editors: [Helix](.config/helix)
- Window manager: [`yabai`](.config/yabai/yabairc)
- Browser: Zen Browser
- Package manager: [Homebrew](https://brew.sh)

## Usage

```bash
# Setup a fresh install of macOS
make setup

# See all available commands for dotfiles
make help

# Symlink everything
stow --adopt .
```
