# benmatselby.zsh-theme

local RETURN_STATUS="%(?:%{$FG[112]%}✔︎:%{$FG[124]%}✘)"

if [ ! -z "${GITHUB_USER}" ]; then
  prompt_username="@${GITHUB_USER}"
else
  prompt_username="%n"
fi

# Primary prompt
PROMPT='
${RETURN_STATUS} $FG[166] ${prompt_username} $FG[061]%~ $(git_prompt_info)
$FG[246]%(!.#.❯)%{$reset_color%} '
PROMPT2='%{$FG[054]%}\ %{$reset_color%}'

RPROMPT=''

# Git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}($FG[033]"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[207] *%{$reset_color%}"

