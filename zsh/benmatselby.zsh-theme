# benmatselby.zsh-theme

# Colours from https://github.com/tokyo-night/tokyo-night-vscode-theme

local return_status="%(?:%{%F{#9ece6a}%}✔︎:%{%F{#f7768e}%}✘)%f"
local directory="%F{#2ac3de}%~%f"
local time="%F{#565f89}%D{%H:%M:%S}%f"
local user_type="%F{#565f89}%(!.#.❯)%f"
local prompt_two_cursor="%F{#565f89}\ %f"
local newline=$'\n'

PROMPT="${return_status} ${directory} "
PROMPT+="${time}${newline}${user_type} "
PROMPT2='${prompt_two_cursor}'
RPROMPT=""
