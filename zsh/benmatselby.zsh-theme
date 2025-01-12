# benmatselby.zsh-theme

# Git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%F{#f7768e}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{#bb9af7}%1{✗%}%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%f"

local return_status="%(?:%{%F{#40a02b}%}✔︎:%{%F{#f7768e}%}✘)%f"
local username="%F{#8839ef}%n%f"
local directory="%F{#209fb5}%~%f"
local time="%F{#91d7e3}%*%f"
local user_type="%F{#f5a97f}%(!.#.❯)%f"
local prompt_two_cursor="%F{#f5a97f}\ %f"
local newline=$'\n'

PROMPT="${return_status} ${username} ${directory} "
PROMPT+='$(git_prompt_info)'
PROMPT+="${time}${newline}${user_type} "
PROMPT2='${prompt_two_cursor}'
