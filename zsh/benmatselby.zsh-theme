# benmatselby.zsh-theme

local RETURN_STATUS="%(?:%{$FG[112]%}✔︎:%{$FG[124]%}✘)"

if [ ! -z "${GITHUB_USER}" ]; then
  prompt_username="@${GITHUB_USER}"
else
  prompt_username="%n"
fi

# Primary prompt
PROMPT='
${RETURN_STATUS} $FG[166] ${prompt_username} $FG[061]%~ $(git_prompt_info) $(aws_prompt_info) $(kube_ps1)
$FG[246]%(!.#.❯)%{$reset_color%} '
PROMPT2='%{$FG[054]%}\ %{$reset_color%}'

RPROMPT=''

# Git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}($FG[033]"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[207] *%{$reset_color%}"

# AWS prompt env vars
ZSH_THEME_AWS_PREFIX="$FG[125]"
ZSH_THEME_AWS_SUFFIX="%{$reset_color%}"
SHOW_AWS_PROMPT=false

# Kubernetes settings
# See https://github.com/jonmosco/kube-ps1#customization
KUBE_PS1_SYMBOL_DEFAULT=""
KUBE_PS1_SEPARATOR=""
KUBE_PS1_SYMBOL_ENABLE=true
KUBE_PS1_CTX_COLOR=37
KUBE_PS1_NS_COLOR=37
KUBE_PS1_PREFIX=""
KUBE_PS1_SUFFIX=""

if ! $(which kubernetes > /dev/null 2>&1); then
  kubeoff
fi
