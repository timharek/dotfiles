NPM_PACKAGES_FILE_NAME = npm_packages.txt
VSCODIUM_EXTENTIONS_FILE_NAME = vscodium/vscodium_extentions.txt

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

setup: ## Setup fresh install of macOS
	sudo -v
	chmod +x macos
	./macos
	ln -s ~/repos/dotfiles/.config ~/.config
	ln -s ~/repos/dotfiles/.zshenv ~/.zshenv
	ln -s ~/repos/dotfiles/.bin ~/.bin
	# Oh-my-zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone --depth 1 https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
	echo "Restart your machine"

brew: ## Install Homebrew and Brewfile formulaes and casks
	brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle --file=~/.config/brew/Brewfile
	ln -s ~/repos/dotfiles/vscodium/settings.json ~/Library/Application\ Support/VSCodium/User/settings.json

brew-dump: ## Update Homebrew formulaes and casks dump
	@brew bundle dump -f

code: ## Install VSCodium / VS Code extensions from dump-file
	@cat ${VSCODIUM_EXTENTIONS_FILE_NAME} | xargs -n 1 codium --install-extension

code-dump: ## Update dump-file for extensions for VSCodium / VS Code
	@codium --list-extensions > ${VSCODIUM_EXTENTIONS_FILE_NAME}

