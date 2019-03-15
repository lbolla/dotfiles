# Profile with:
# $> for i in $(seq 1 10); do time $SHELL -i -c exit; done
# Or enable profiling: (zprof at bottom of file, too)
# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=/opt/helm:$PATH
export PATH=/opt/texlive/2018/bin/x86_64-linux:$PATH
export PATH=/home/lbolla/.nimble/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/lbolla/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="minimal"
# ZSH_THEME="nanotech"
# ZSH_THEME="af-magic"
# ZSH_THEME="refined"
ZSH_THEME="af-magic-lbolla"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/src/github.com/lbolla/dotfiles/oh-my-zsh/.oh-my-zsh/custom/

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
    cargo
    colored-man-pages
    common-aliases
    docker
    emacs
    fzf
    helm
    httpie
    git
    kubectl
    kubectl-patch
    kube-ps1
    paver
    stern
    tmux
    virtualenv
    virtualenvwrapper
    web-search
    z
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
# else
#     nocaps
fi

# For white bg
if [[ "$IN_X" = "no" ]]; then
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=1'
else
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
fi

# R libs
export C_INCLUDE_PATH=/usr/lib/R/include

# GnuPG
export GPG_TTY=$(tty)

# zprof
