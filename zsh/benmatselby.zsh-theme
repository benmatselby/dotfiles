# benmatselby.zsh-theme

# Colours from https://rosepinetheme.com/palette (Moon variant)

# Git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%F{#ea9a97}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{#ea9a97}%1{✗%}%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%f"

local return_status="%(?:%{%F{#3e8fb0}%}✔︎:%{%F{#eb6f92}%}✘)%f"
local username="%F{#c4a7e7}%n%f"
local directory="%F{#9ccfd8}%~%f"
local time="%F{#6e6a86}%D{%H:%M:%S}%f"
local user_type="%F{#6e6a86}%(!.#.❯)%f"
local prompt_two_cursor="%F{#6e6a86}\ %f"
local newline=$'\n'

PROMPT="${return_status} ${username} ${directory} "
PROMPT+='$(git_prompt_info)'
PROMPT+="${time}${newline}${user_type} "
PROMPT2='${prompt_two_cursor}'
RPROMPT=""
