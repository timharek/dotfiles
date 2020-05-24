#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install useful binaries
brew install htop
brew install openjdk
brew install tree
brew install maven
brew install deno
brew install node
brew install gh

# Install useful apps
brew cask install appcleaner
brew cask install dozer
brew cask install gulp
brew cask install pomotroid
brew cask install vlc
brew cask install vscodium
brew cask install rectangle
brew cask install joplin
brew cask install java
brew cask install chromedriver
brew cask install eloston-chromium

# Remove outdated versions from the cellar.
brew cleanup