# benmatselby.zsh-theme

local RETURN_STATUS="%(?:%{$FG[006]%}✔︎:%{$FG[009]%}✘)"

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
${RETURN_STATUS} $FG[237] %m @ %* %{$reset_color%}% $FG[087]%~ $(git_prompt_info) $FG[105]%(!.#.»)%{$reset_color%}
'
PROMPT2='%{$FG[009]%}\ %{$reset_color%}'

# Right prompt
RPROMPT=''
if kubectx -c 2>/dev/null; then
  RPROMPT+='$(kube_ps1)'
fi
RPROMPT+='$(aws_prompt_info)'

# Git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[254]($FG[254]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[254])%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[214] *%{$reset_color%}"

# AWS prompt env vars
ZSH_THEME_AWS_PREFIX=" ☁️  "
ZSH_THEME_AWS_SUFFIX=" "
