# af-magic.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

# color vars
eval my_gray='$FG[242]'
eval my_orange='$FG[214]'

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?:%{$FG[105]%}» :%{$my_orange%}» )"

# From kube_ps1 oh-my-zsh plugin
export KUBE_PS1_SYMBOL_ENABLE=false

# primary prompt
PROMPT='
$FG[032]%~\
$(git_prompt_info) \
$FG[105]%(!.#.)${return_code}%{$reset_color%}'
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# right prompt
if type "virtualenv_prompt_info" > /dev/null
then
    RPROMPT='$(kube_ps1)$(virtualenv_prompt_info)%{$reset_color%}%'
else
    RPROMPT='$(kube_ps1){$reset_color%}%'
fi
# Don't show rprompt on previous commands
setopt TRANSIENT_RPROMPT

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
