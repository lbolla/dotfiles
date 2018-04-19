# af-magic.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

# color vars
eval my_gray='$FG[242]'
eval my_orange='$FG[214]'

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?:%{$FG[105]%}» :%{$my_orange%}» )"

# Should really be used as plugin
# source $HOME/.oh-my-zsh/plugins/kube-ps1/kube-ps1.zsh 
function __k8s_ps1 {
    if type "kubectl" > /dev/null
    then
        echo "%{$my_gray%}`kubectl config get-contexts | awk '/\*/ { printf "(K8S:%s|%s)", $3, $5}'`%{$reset_color%}"
    fi
}

# primary prompt
PROMPT='$FG[237]------------------------------------------------------------%{$reset_color%}
$FG[032]%~\
$(git_prompt_info) \
$FG[105]%(!.#.)${return_code}%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# right prompt
if type "virtualenv_prompt_info" > /dev/null
then
	RPROMPT='$(__k8s_ps1)$(virtualenv_prompt_info)%{$reset_color%}%'
else
	RPROMPT='$(__k8s_ps1){$reset_color%}%'
fi

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
