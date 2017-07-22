# See http://stackoverflow.com/questions/171563/whats-in-your-zshrc
# Some system-wide vars are set in .profile so that gnome-session can set them.
# Nifty config:
# https://github.com/jleclanche/dotfiles/blob/master/.zshrc

#{{{ ZSH Modules
autoload -Uz promptinit compinit colors parameter
promptinit
compinit
colors
#}}}

#{{{ Options
setopt AUTO_CD
unsetopt AUTO_PUSHD
unsetopt MENU_COMPLETE
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt PROMPT_SUBST
setopt RM_STAR_WAIT
unsetopt SHARE_HISTORY
setopt EXTENDED_GLOB
#}}}

#{{{ Variables

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
if [[ -x `which mupdf` ]]; then
    PDFVIEWER=mupdf
elif [[ -x `which evince` ]]; then
    PDFVIEWER=evince
fi
if [[ -x `which soffice` ]]; then
    DOCVIEWER=soffice
    PPTVIEWER=soffice
    XLSVIEWER=soffice
elif [[ -x `which abiword` ]]; then
    DOCVIEWER=abiword
    PPTVIEWER=abiword
    XLSVIEWER=abiword
fi
if [[ -x `which eog` ]]; then
	IMAGEVIEWER=eog
elif [[ -x `which qiv` ]]; then
	IMAGEVIEWER=qiv
fi
#}}}

#{{{ Plan9
function 9acme {
	mkdir -p /tmp/font
	pkill -0 fontsrv || fontsrv -m /tmp/font &
	pkill -0 plumber || plumber &
	SHELL=rc 9 acme -a -f /tmp/font/Ubuntu\ Mono/11a/font
}
#}}}

#{{{ Aliases
alias -s doc=$DOCVIEWER
alias -s docx=$DOCVIEWER
alias -s odt=$DOCVIEWER
alias -s xls=$XLSVIEWER
alias -s xlsx=$XLSVIEWER
alias -s gif=$IMAGEVIEWER
alias -s hs=stack
alias -s jpg=$IMAGEVIEWER
alias -s JPG=$IMAGEVIEWER
alias -s json='python -m json.tool'
alias -s pdf=$PDFVIEWER
alias -s png=$IMAGEVIEWER
alias -s ppt=$PPTVIEWER
alias -s pptx=$PPTVIEWER
alias -s html=$BROWSER
alias -s zip=file-roller
alias -s vcs='vcal -all'
alias E='emacsclient -n'
alias bc='bc -ql'
alias capture='import -window `xwininfo |grep "Window id:" |cut -d" " -f4` /tmp/capture.jpg'
alias cdrip='ripit'
alias cindent='indent -kr -nut'
alias csvtable="sed 's/,,/, ,/g;s/,,/, ,/g' | column -s, -t | less -#2 -FNSX"
alias diff2='diff -y --suppress-common-lines'
alias e=vim
# alias em='emacs -nw'
# alias google-chrome-def="google-chrome --profile-directory=Default --explicitly-allowed-ports=6000"
# alias google-chrome-fun="google-chrome --profile-directory=\"Profile 2\""
# alias google-chrome-inc="google-chrome --incognito"
# alias google-chrome-netflix="google-chrome --profile-directory=\"Profile 2\" --proxy-server=\"socks://localhost:9999\""
alias l='ls -l --color'
alias linodefs='mkdir -p /tmp/linode && sshfs lbolla.info:/ /tmp/linode'
alias linodesh='ssh -X lbolla.info'
alias ll='ls -la --color'
alias lp='lp -o fit-to-page -o media=a4'
alias ls='ls --color'
alias lsdir='find . -mindepth 1 -maxdepth 1 -type d'
# alias mutt-gmail='MUTT_PROFILE=gmail mutt'
# alias mutt-networkscale='MUTT_PROFILE=networkscale mutt'
# alias mutt-pispo-customerservice='MUTT_PROFILE=pispo-customerservice mutt'
# alias mutt-pispo-info='MUTT_PROFILE=pispo-info mutt'
# alias mutt-pispo='MUTT_PROFILE=pispo mutt'
# alias mutt-reddeer='MUTT_PROFILE=reddeer mutt'
alias pg='ps -eF | grep'
alias psp="ps -eo pid,tid,class,rtprio,ni,pri,psr,pcpu,stat,wchan:28,comm"
alias psz="ps aux | awk '{ print \$8 \" \" \$2 }' | grep Z"
alias rdesktop='rdesktop -r clipboard:PRIMARYCLIPBOARD -g 1280x1024'
alias remove_dups="awk 'NF && !(\$1 in a){a[\$1];p=\$1;print (getline == 0) ? p : p}'"
alias rm='rm -i'
alias rot13='tr a-zA-Z n-za-mN-ZA-M'
# alias screen-mail='screen -S mail -c ~/.screenrc-mail'
alias sqlitetmp='mkdir -p /tmp/sqlite && sudo mount tmpfs -t tmpfs /tmp/sqlite'
# alias tmux='tmux -2'
alias ttyplay="scriptreplay /tmp/timingfile"
alias ttyrec="script -t 2> /tmp/timingfile"
alias mkvirtualenv2="mkvirtualenv --python /usr/local/bin/python2"
alias mkvirtualenv3="mkvirtualenv --python /usr/local/bin/python3"
alias w='workon'
alias num_open_files="cat /proc/sys/fs/file-nr"
alias pssh=parallel-ssh
alias opennic-nearest="curl -s 'https://api.opennicproject.org/geoip/?nearest' | cut -d ' ' -f 1 | head -3"
#}}}

#{{{ Functions
function diff2 {
    # Side-by-side diff
    diff -y -W $COLUMNS $1 $2
}
function mccabe-find {
    find $1 -name "*.py" -exec mccabe -m 10 {} \; | sed "s/[(),]//g" | awk "{print \$3, \$1, \$2}" | sort -n
}
function rand {
    python -c "import random; print random.random()"
}
function randint {
    python -c "import random; print random.randint($1, $2)"
}
function num_threads {
    grep -s '^Threads' /proc/[0-9]*/status | awk '{ sum += $2; } END { print sum; }'
}
function find-missing {
    # Find directories which don't contain files matching `pattern`
    # E.g. find-missing /tmp 'ciao*' 1
    dirname=$1
    pattern=$2
    depth=$3
    comm -3 <(find $dirname -name "$2" -printf '%h\n' | sort) <(find $dirname -mindepth $depth -maxdepth $depth -type d | sort)
}
#}}}

#{{{ Private
[[ -f ~/.zsh_private ]] && source ~/.zsh_private
#}}}

#{{{ Prompt
source ~/.git-prompt.sh

function __hg_ps1 {
	hgbranch=`hg branch 2> /dev/null | awk '{print $1}'`
	hgdirty=""
	if [ -n "$hgbranch" ]; then
		hgbook=`hg bookmarks | awk '/\*/{print $2}'`
		[ -n "$hgbook" ] && hgbook=":%{$fg[blue]%}$hgbook%{$reset_color%}%"
		[ -n "`hg -q diff`" ] && hgdirty=" *"
		echo "(HG:$hgbranch$hgbook$hgdirty)"
	fi
}

function __venv_ps1 {
    if [ -n "$VIRTUAL_ENV" ]; then
        echo "[`basename $VIRTUAL_ENV`]"
    else
        echo ""
    fi
}

function __haskell_pkg_info {
    # TODO should search for files in parent dirs, too
    # Use .zsh extended globbing
    # tmp=`ls (../)#stack.yaml(:a)"
    cabal_files=(*.cabal(N))
    if [ $#cabal_files -gt 0 ]; then
            if [ -f stack.yaml ]; then
                    # echo "%{$fg[green]%}(λ:stack)%{$reset_color%}"
                    echo ""
            elif [ -f cabal.sandbox.config ]; then
                    echo "%{$fg[orange]%}(λ:no-stack)%{$reset_color%}"
            else
                    echo "%{$fg[red]%}(λ:not-sandboxed)%{$reset_color%}"
            fi
    fi
}

GIT_PS1_SHOWDIRTYSTATE=true
export PROMPT='%B%(?..[%?] )%b%n@%U%m%u %F%B%{$fg[yellow]%}%~%f%{$reset_color%}%b % > '
# export RPROMPT='%B$(__git_ps1 "(GIT:%s)")$(__hg_ps1)$(__haskell_pkg_info)%b %{$fg[green]%}$(__venv_ps1)%{$reset_color%}%'
export RPROMPT='%B$(__git_ps1 "(GIT:%s)")$(__hg_ps1)%b %{$fg[green]%}$(__venv_ps1)%{$reset_color%}%'
#}}}

#{{{ Bindings
bindkey -e
bindkey \^U backward-kill-line
# ctrl-left
bindkey "\e[1;5D" backward-word
# ctrl-right
bindkey "\e[1;5C" forward-word
# shift-tab
bindkey "\e[Z" reverse-menu-complete
# ctrl-e to edit current line in $EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey "^v" edit-command-line
#}}}

#{{{ External scripts
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
# if [[ -z "$VIRTUAL_ENV" ]]; then
    if [[ -x `which virtualenvwrapper.sh` ]]; then
	source `which virtualenvwrapper.sh`
    elif [[ -f /usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh ]]; then
        source /usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh
    elif [[ -f /etc/bash_completion.d/virtualenvwrapper ]]; then
	source /etc/bash_completion.d/virtualenvwrapper
    fi
# fi
#}}}

#{{{ Styles
#  eval "$(dircolors -b)"
LS_COLORS='rs=0:di=01;37:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#  zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
#}}}

#{{{ Custom competions
_paver_tasks () {
    reply=( $(paver help | awk '/^  ([a-zA-Z_]+).+-/{print $1}') )
}
compctl -K _paver_tasks paver

_vagrant_cmds () {
    reply=( $(vagrant help | awk '/^     /{print $1}') )
}
compctl -K _vagrant_cmds vagrant

_alembic_cmds () {
    reply=( $(alembic 2>&1 | grep "{branches" | sed -e 's/^\ *//' -e 's/[{}]//g' -e 's/,/\n/g') )
}
compctl -K _alembic_cmds alembic

_devpi_cmds () {
    reply=( $(devpi -h | grep '  {' | sed 's/[ {}]//g' | sed 's/,/\n/g' ) )
}
compctl -K _devpi_cmds devpi

_rebar3_cmds () {
    reply=( $(rebar3 2> /dev/null | grep -e "^[a-z]" | grep -ve "<task>" | cut -d ' ' -f 1) )
}
compctl -K _rebar3_cmds rebar3

_mix_cmds () {
    reply=( $(mix help | grep "^mix" | awk '/^mix [a-z]/{ print $2 }') )
}
compctl -K _mix_cmds mix

# kubectl autocomplete
source <(kubectl completion zsh)

#}}}

#{{{ Window title

function title() {
    # escape '%' chars in $1, make nonprintables visible
    local a=${(V)1//\%/\%\%}

    # Truncate command, and join lines.
    a=$(print -Pn "%40>...>$a" | tr -d "\n")
    case $TERM in
        screen*)
            print -Pn "\e]2;$a @ $2\a" # plain xterm title
            print -Pn "\ek$a\e\\"      # screen title (in ^A")
            print -Pn "\e_$2   \e\\"   # screen location
            ;;
        xterm*)
            print -Pn "\e]2;$a @ $2\a" # plain xterm title
            ;;
    esac
}

# precmd is called just before the prompt is printed
function precmd() {
    title "zsh" "%m:%55<...<%~"
}

# preexec is called just before any command line is executed
function preexec() {
    title "$1" "%m:%35<...<%~"
}

#}}}

#{{{ Other goodies
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
source ~/src/zsh-autosuggestions/zsh-autosuggestions.zsh
if [[ $TERM = "linux" ]]; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
elif [[ -n $INSIDE_EMACS ]]; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
fi
#}}}
