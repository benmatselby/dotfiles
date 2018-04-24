# Bash scripts to load
if [ -f /usr/local/etc/bash_completion ]; then
    source /usr/local/etc/bash_completion
fi

for file in ~/.{bash_aliases,bash_prompt,bash_docker,bash_functions,bash_work_aliases,exports,indeed}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		source "$file"
	fi
done
unset file
