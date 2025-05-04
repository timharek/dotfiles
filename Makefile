NPM_PACKAGES_FILE_NAME = npm_packages.txt
VSCODIUM_EXTENTIONS_FILE_NAME = vscodium/vscodium_extentions.txt

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

setup: ## Setup fresh install of macOS
	sudo -v
	chmod +x macos
	./macos

brew-setup: ## Install Homebrew and Brewfile formulaes and casks
	brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle --file=~/.config/brew/Brewfile
	ln -s ~/repos/dotfiles/vscodium/settings.json ~/Library/Application\ Support/VSCodium/User/settings.json

brew-dump: ## Update Homebrew formulaes and casks dump
	@brew bundle dump -f

