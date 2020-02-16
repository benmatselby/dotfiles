# benmatselby.zsh-theme
# Theme is a blend of [af-magic](https://github.com/andyfleming/oh-my-zsh) and [robbyrussell](https://github.com/robbyrussell/oh-my-zsh)

local RETURN_STATUS="%(?:%{$FG[006]%}✔︎:%{$FG[009]%}✘)"

# primary prompt
PROMPT='
${RETURN_STATUS} $FG[237] %m @ %* %{$reset_color%}% $FG[087]%~ $(git_prompt_info) $FG[105]%(!.#.»)%{$reset_color%}
'
PROMPT2='%{$FG[009]%}\ %{$reset_color%}'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[254]($FG[254]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[254])%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[214] *%{$reset_color%}"
