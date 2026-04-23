# benmatselby.zsh-theme

# Colours from https://github.com/tokyo-night/tokyo-night-vscode-theme (Night variant)

# Git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%F{#f7768e}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{#f7768e}%1{✗%}%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%f"

local return_status="%(?:%{%F{#73daca}%}✔︎:%{%F{#f7768e}%}✘)%f"
local username="%F{#bb9af7}%n%f"
local directory="%F{#7dcfff}%~%f"
local time="%F{#565f89}%D{%H:%M:%S}%f"
local user_type="%F{#565f89}%(!.#.❯)%f"
local prompt_two_cursor="%F{#565f89}\ %f"
local newline=$'\n'

PROMPT="${return_status} ${username} ${directory} "
PROMPT+='$(git_prompt_info)'
PROMPT+="${time}${newline}${user_type} "
PROMPT2='${prompt_two_cursor}'
RPROMPT=""
