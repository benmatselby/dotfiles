#!/bin/bash

# Bash scripts to load
# Mac/Darwin
if [ -f /usr/local/etc/bash_completion ]; then
	# shellcheck disable=SC1091
	source /usr/local/etc/bash_completion
fi

# Ubuntu
if [ -f /usr/share/bash-completion/bash_completion ]; then
	# shellcheck disable=SC1091
    source /usr/share/bash-completion/bash_completion
fi


for file in ~/.{bash_aliases,bash_prompt,bash_docker,bash_functions,bash_work_aliases,exports,indeed}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck disable=SC1090
		source "$file"
	fi
done
unset file
