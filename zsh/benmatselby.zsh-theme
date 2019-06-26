# benmatselby.zsh-theme
# Theme is a blend of [af-magic](https://github.com/andyfleming/oh-my-zsh) and [robbyrussell](https://github.com/robbyrussell/oh-my-zsh)

if [ $UID -eq 0 ]; then
  NCOLOR="red";
else
  NCOLOR="green";
fi

local ret_status="%(?:%{$fg_bold[green]%}✔︎ :%{$fg_bold[red]%}✘ )"
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# primary prompt
PROMPT='
${ret_status} $FG[032]%~\
 $(git_prompt_info) \
$FG[105]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

# right prompt
if type "virtualenv_prompt_info" > /dev/null
then
  RPROMPT='$(virtualenv_prompt_info)$my_gray%m @ %*%{$reset_color%}%'
else
  RPROMPT='$my_gray%m @ %*%{$reset_color%}%'
fi

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
