# Profile with:
# $> for i in $(seq 1 10); do time $SHELL -i -c exit; done
# Or enable profiling: (zprof at bottom of file, too)
# zmodload zsh/zprof

if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  # Use a simple, clean prompt for VSCode
  PROMPT='%F{cyan}%~%f %F{green}❯%f '

  # VSCode shell integration - ADD THIS AT THE END
  "$(code --locate-shell-integration-path zsh)"

else
  ZSH_THEME="powerlevel10k/powerlevel10k"

  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
PATHS=(
    "${HOME}/.cache/rebar3/bin"
    "${HOME}/.nimble/bin"
    "${HOME}/.poetry/bin"
    "${HOME}/go/bin"
    "${HOME}/perl5/bin"
    "/opt/apache-maven-3.6.3/bin"
)
for p in "${PATHS[@]}"; do
    if [ -d "${p}" ]; then
        export PATH=${p}:$PATH
    fi
done

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/src/github.com/lbolla/dotfiles/oh-my-zsh/.oh-my-zsh/custom/

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
    aws
    colored-man-pages
    common-aliases
    docker
    emacs
    fzf
    helm
    helm3
    httpie
    ghcup
    gitfast
    kubectl
    kubectl-patch
    # kube-ps1  # Slow! enable with KUBE_PS1_ENABLED (used in theme)
    lxd-completion-zsh
    nvm
    paver
    # pyenv
    rclone
    restic
    rust
    stern
    tmux
    virtualenv
    virtualenvwrapper
    # web-search
    z
    zsh-autosuggestions
    # Note: keep fzf-tab at the end because it overwrites some keybindings
    # fzf-tab
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias cdp='cd "$(git rev-parse --show-toplevel || echo .)"'

# Rehash automatically (https://wiki.archlinux.org/index.php/zsh#Persistent_rehash)
zstyle ':completion:*' rehash true

if [[ $IN_X = "yes" ]]
then
    if [[ -z "$GNOME_TERMINAL_SCREEN" ]]
    then
        # Ctrl-arrow (xterm, urxvt)
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word
        bindkey "^[Od" backward-word
        bindkey "^[Oc" forward-word
    fi
fi

# For white bg
if [[ "$IN_X" = "no" ]]; then
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=1'
else
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'
fi

# R libs
export C_INCLUDE_PATH=/usr/lib/R/include

# GnuPG
export GPG_TTY=$(tty)

# FZF
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

autoload zmv

# zprof
