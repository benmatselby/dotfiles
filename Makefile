HOME ?= `$HOME`
PWD ?= `pwd`
OS ?= $(shell uname -s)
SUBLIME_FOLDER ?= $(HOME)/Library/Application Support/Sublime Text 3/Packages/User

.PHONY: provision
provision: bashfiles sublime

.PHONY: bashfiles
bashfiles:
	for file in  \
	.bash_aliases \
	.bash_functions \
	.bash_profile \
	.gitconfig \
	.gitignore \
	.vimrc \
	.curlrc \
	; \
	do \
		echo $$file; \
		ln -sf $(PWD)/$$file $(HOME)/$$file; \
	done

.PHONY: sublime
sublime:
ifeq ($(OS),Darwin)
	ln -sf "$(PWD)/Preferences.sublime-settings" "$(SUBLIME_FOLDER)/Preferences.sublime-settings"
	ln -sf "$(PWD)/Default (OSX).sublime-keymap" "$(SUBLIME_FOLDER)/Default (OSX).sublime-keymap"
endif
