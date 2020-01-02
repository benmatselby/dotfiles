HOME ?= `$HOME`
PWD ?= `pwd`

explain: ## Provide the explanation of how to use the Makefile`
	### Welcome
	#
	### Installation
	#
	#  -> $$ make provision-[bash|zsh]
	#
	### Install `code` extension
	#
	#  -> $$ make install-vscode-ext
	#
	### Targets
	@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: provision-bash
provision-bash: bashfiles install-app-config setup-git-config ## Provision all the dotfiles for a bash shell

.PHONY: provision-zsh
provision-zsh: zshfiles install-app-config setup-git-config ## Provision all the dotfiles for a Z shell

.PHONY: zshfiles
zshfiles: ## Link all the zsh files into the relevant places
	ln -sf $(PWD)/zsh/.zshrc $(HOME)/.zshrc
	ln -sf $(PWD)/zsh/benmatselby.zsh-theme $(HOME)/.oh-my-zsh/custom/themes/
	ln -sf $(PWD)/common/aliases $(HOME)/.oh-my-zsh/custom/aliases.zsh
	ln -sf $(PWD)/common/exports $(HOME)/.oh-my-zsh/custom/exports.zsh
	ln -sf $(PWD)/common/functions $(HOME)/.oh-my-zsh/custom/functions.zsh
	ln -sf $(PWD)/common/.inputrc $(HOME)/.inputrc
	ln -sf $(PWD)/common/.vimrc $(HOME)/.vimrc
	ln -sf $(PWD)/git/.gitconfig $(HOME)/.gitconfig
	ln -sf $(PWD)/git/.gitignore $(HOME)/.gitignore

.PHONY: bashfiles
bashfiles: ## Link all the bash aliases into the relevant places
	ln -sf $(PWD)/common/functions $(HOME)/.bash_functions
	ln -sf $(PWD)/bash/.bash_profile $(HOME)/.bash_profile
	ln -sf $(PWD)/bash/.bash_prompt $(HOME)/.bash_prompt
	ln -sf $(PWD)/bash/.bash_docker $(HOME)/.bash_docker

.PHONY: setup-git-config
setup-git-config: ## Setup the git configuration
	@echo '##'
	@echo '# Setup the local git configuration'
	@echo '##'
ifeq ("$(wildcard $(HOME)/.gitconfig.local)","")
	cp .gitconfig.local $(HOME)/.gitconfig.local
	@echo "Enter your full name";
	@read -e name; \
	sed -i '' "s/GITNAME/$$name/" $(HOME)/.gitconfig.local
	@echo "Enter your email address";
	@read -e email; \
	sed -i '' "s/GITEMAIL/$$email/g" $(HOME)/.gitconfig.local
endif

.PHONY: test
test: ## Test the shell scripts lint OK
	shellcheck .bash_* .exports

.PHONY: install-app-config
install-app-config: ## Install application specific settings
	ln -sf $(PWD)/vscode/settings.json "$(HOME)/Library/Application Support/Code/User/settings.json"

.PHONY: install-vscode-ext
install-vscode-ext: ## Install all the vs code plugins I use
	code --install-extension Tyriar.sort-lines \
		--install-extension DavidAnson.vscode-markdownlint \
		--install-extension DotJoshJohnson.xml \
		--install-extension dbaeumer.vscode-eslint \
		--install-extension esbenp.prettier-vscode \
		--install-extension ms-python.python \
		--install-extension ms-vscode.Go \
		--install-extension msjsdiag.debugger-for-chrome \
		--install-extension ms-azuretools.vscode-docker \
		--install-extension streetsidesoftware.code-spell-checker \
		--install-extension timonwong.shellcheck
