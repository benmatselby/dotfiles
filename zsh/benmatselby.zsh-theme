# benmatselby.zsh-theme

local RETURN_STATUS="%(?:%{$FG[112]%}✔︎:%{$FG[124]%}✘)"

# Primary prompt
PROMPT='
${RETURN_STATUS} $FG[178]%~ $(git_prompt_info) $(aws_prompt_info) $(kube_ps1)
$FG[246]%(!.#.❯)%{$reset_color%} '
PROMPT2='%{$FG[054]%}\ %{$reset_color%}'

RPROMPT=''

# Git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[246]git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[207]*%{$reset_color%}"

# AWS prompt env vars
ZSH_THEME_AWS_PREFIX="$FG[246]☁️ :"
ZSH_THEME_AWS_SUFFIX="%{$reset_color%}"
SHOW_AWS_PROMPT=false

# Kubernetes settings
# See https://github.com/jonmosco/kube-ps1#customization
KUBE_PS1_SYMBOL_DEFAULT="$FG[246]☸️ :%{$reset_color%}"
KUBE_PS1_SEPARATOR=""
KUBE_PS1_SYMBOL_ENABLE=true
KUBE_PS1_CTX_COLOR=246
KUBE_PS1_NS_COLOR=246
KUBE_PS1_PREFIX=""
KUBE_PS1_SUFFIX=""
