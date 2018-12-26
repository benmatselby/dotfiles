HOME ?= `$HOME`
PWD ?= `pwd`

explain: ## Provide the explanation of how to use the Makefile`
	### Welcome
	#
	### Installation
	#
	#  -> $$ make provision
	#
	### Install `code` extension
	#
	#  -> $$ make install-vscode-ext
	#
	### Targets
	@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: provision
provision: bashfiles setup-git-config ## Provision all the dotfiles

.PHONY: bashfiles
bashfiles: ## Link all the bash aliases into the relevant places
	@echo '##'
	@echo '# Symlink the dot files in'
	@echo '##'
	for file in  \
	.bash_aliases \
	.bash_functions \
	.bash_profile \
	.bash_prompt \
	.bash_docker \
	.exports \
	.gitconfig \
	.gitignore \
	.vimrc \
	.inputrc \
	; \
	do \
		echo $$file; \
		ln -sf $(PWD)/$$file $(HOME)/$$file; \
	done

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

.PHONY: install-vscode-ext
install-vscode-ext: ## Install all the vs code plugins I use
	code --install-extension Tyriar.sort-lines \
		--install-extension DavidAnson.vscode-markdownlint \
		--install-extension DotJoshJohnson.xml \
		--install-extension eg2.tslint \
		--install-extension esbenp.prettier-vscode \
		--install-extension ms-python.python \
		--install-extension ms-vscode.Go \
		--install-extension msjsdiag.debugger-for-chrome \
		--install-extension PeterJausovec.vscode-docker \
		--install-extension streetsidesoftware.code-spell-checker \
		--install-extension timonwong.shellcheck
