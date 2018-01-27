HOME ?= `$HOME`
PWD ?= `pwd`
OS ?= $(shell uname -s)
SUBLIME_FOLDER ?= $(HOME)/Library/Application Support/Sublime Text 3/Packages/User

.PHONY: provision
provision: bashfiles setup-git-config sublime

.PHONY: bashfiles
bashfiles:
	@echo '##'
	@echo '# Symlink the dot files in'
	@echo '##'
	for file in  \
	.bash_aliases \
	.bash_functions \
	.bash_profile \
	.bash_docker \
	.bash_git \
	.gitconfig \
	.gitignore \
	.vimrc \
	.curlrc \
	.inputrc \
	; \
	do \
		echo $$file; \
		ln -sf $(PWD)/$$file $(HOME)/$$file; \
	done

.PHONY: setup-git-config
setup-git-config:
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

.PHONY: sublime
sublime:
	@echo '##'
	@echo '# Setup the Sublime Text Preferences'
	@echo '##'
ifeq ($(OS),Darwin)
	ln -sf "$(PWD)/Preferences.sublime-settings" "$(SUBLIME_FOLDER)/Preferences.sublime-settings"
	ln -sf "$(PWD)/Default (OSX).sublime-keymap" "$(SUBLIME_FOLDER)/Default (OSX).sublime-keymap"
endif
