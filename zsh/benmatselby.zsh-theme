# benmatselby.zsh-theme

local RETURN_STATUS="%(?:%{$FG[112]%}✔︎:%{$FG[124]%}✘)"

# Kubernetes settings
# See https://github.com/jonmosco/kube-ps1#customization
KUBE_PS1_SYMBOL_DEFAULT="☸️ "
KUBE_PS1_SEPARATOR=" "
KUBE_PS1_SYMBOL_ENABLE=true
KUBE_PS1_CTX_COLOR=237
KUBE_PS1_NS_COLOR=237
KUBE_PS1_PREFIX=""
KUBE_PS1_SUFFIX=""

# Primary prompt
PROMPT='
${RETURN_STATUS} $FG[075]%~ $(git_prompt_info) $(aws_prompt_info)
$FG[054]%(!.#.❯)%{$reset_color%} '
PROMPT2='%{$FG[054]%}\ %{$reset_color%}'

# Right prompt
RPROMPT=''
RPROMPT+='$(kube_ps1)'

# Git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[246]git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[214]*%{$reset_color%}"

# AWS prompt env vars
ZSH_THEME_AWS_PREFIX="$FG[246]☁️ :"
ZSH_THEME_AWS_SUFFIX="%{$reset_color%}"
