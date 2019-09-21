# benmatselby.zsh-theme
# Theme is a blend of [af-magic](https://github.com/andyfleming/oh-my-zsh) and [robbyrussell](https://github.com/robbyrussell/oh-my-zsh)

local ret_status="%(?:%{$fg_bold[green]%}✔︎ :%{$fg_bold[red]%}✘ )"
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

prompt_aws() {
  [[ -z "$AWS_PROFILE" ]] && return
  echo "${my_orange}(☁️  ${AWS_PROFILE})${reset_color}"
}


# primary prompt
PROMPT='
${ret_status} $my_gray%m @ %*%{$reset_color%}%  $FG[032]%~ \
$(git_prompt_info) $(prompt_aws) \
$FG[105]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
