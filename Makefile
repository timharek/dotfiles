NPM_PACKAGES_FILE_NAME = npm_packages.txt
VSCODIUM_EXTENTIONS_FILE_NAME = vscodium_extentions.txt

setup: ## Setup fresh install of macOS
	sudo -v
	chmod +x macos
	./macos
	ln -s ~/repos/dotfiles/.config ~/.config
	ln -s ~/repos/dotfiles/.bin ~/.bin
	ln -s ~/repos/dotfiles/.hammerspoon ~/.hammerspoon
	ln -s ~/repos/dotfiles/vscodium/settings.json ~/Library/Application\ Support/VSCodium/User/settings.json
	echo "Restart your machine"

brew: ## Install Homebrew and Brewfile formulaes and casks
	brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle

brew-dump: ## Update Homebrew formulaes and casks dump
	brew bundle dump -f

npm: ## Install dump-file for globally installed NPM packages
	sed -e 's/.*@//g' ${NPM_PACKAGES_FILE_NAME} | xargs -n 1 npm install -g

npm-dump: ## Update dump-file for globally installed NPM packages
	ls -1 `npm root -g` > ${NPM_PACKAGES_FILE_NAME}

code: ## Install VSCodium / VS Code extensions from dump-file
	cat ${VSCODIUM_EXTENTIONS_FILE_NAME} | xargs -n 1 codium --install-extension

code-dump: ## Update dump-file for extensions for VSCodium / VS Code
	codium --list-extensions > ${VSCODIUM_EXTENTIONS_FILE_NAME}

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

