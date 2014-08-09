# See http://stackoverflow.com/questions/171563/whats-in-your-zshrc

#{{{ ZSH Modules
autoload -Uz promptinit compinit colors
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
#}}}

#{{{ Variables
export TERM=xterm-256color
export PATH=$HOME/bin:$HOME/.cabal/bin:$HOME/src/cmd:/opt/firefox:/usr/local/pgsql/bin:/opt/cisco/anyconnect/bin:$HOME/src/go/bin:$HOME/src/emacs-24.3/src:$HOME/src/emacs-24.3/lib-src:$PATH
export PYTHONSTARTUP="$HOME/.pyrc"
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
export EDITOR=vim
export PAGER=less
export BROWSER=google-chrome
if [[ -x `which mupdf` ]]; then
    PDFVIEWER=mupdf
elif [[ -x `which evince` ]]; then
    PDFVIEWER=evince
fi
if [[ -x `which soffice` ]]; then
    DOCVIEWER=soffice
    PPTVIEWER=soffice
elif [[ -x `which evince` ]]; then
    DOCVIEWER=abiword
    PPTVIEWER=abiword
fi
if [[ -x `which eog` ]]; then
	IMAGEVIEWER=eog
elif [[ -x `which qiv` ]]; then
	IMAGEVIEWER=qiv
fi
#}}}

#{{{ Go
export GOROOT=$HOME/src/go
export GOPATH=$HOME/junk/go
export PATH=$PATH:$GOROOT/bin
#}}}

#{{{ Plan9
export PLAN9=/home/lbolla/src/plan9port
export PATH=$PATH:$PLAN9/bin
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
alias -s gif=$IMAGEVIEWER
alias -s hs=runhaskell
alias -s jpg=$IMAGEVIEWER
alias -s json='python -m json.tool'
alias -s pdf=$PDFVIEWER
alias -s png=$IMAGEVIEWER
alias -s ppt=$PPTVIEWER
alias -s pptx=$PPTVIEWER
alias capture='import -window `xwininfo |grep "Window id:" |cut -d" " -f4` /tmp/capture.jpg'
alias cdrip='ripit'
alias cindent='indent -kr -nut'
alias e=vim
alias em='emacs -nw'
alias l='ls -l --color'
alias linodefs='mkdir -p /tmp/linode && sshfs lbolla.info:/ /tmp/linode'
alias linodesh='ssh -X lbolla.info'
alias ll='ls -la --color'
alias lp='lp -o fit-to-page -o media=a4'
alias ls='ls --color'
alias mutt-gmail='MUTT_PROFILE=gmail mutt'
alias mutt-networkscale='MUTT_PROFILE=networkscale mutt'
alias mutt-pispo-customerservice='MUTT_PROFILE=pispo-customerservice mutt'
alias mutt-pispo-info='MUTT_PROFILE=pispo-info mutt'
alias mutt-pispo='MUTT_PROFILE=pispo mutt'
alias mutt-reddeer='MUTT_PROFILE=reddeer mutt'
alias pg='ps aux | grep'
alias psp="ps -eo pid,tid,class,rtprio,ni,pri,psr,pcpu,stat,wchan:28,comm"
alias psz="ps aux | awk '{ print \$8 \" \" \$2 }' | grep Z"
alias rdesktop='rdesktop -r clipboard:PRIMARYCLIPBOARD -g 1280x1024'
alias rm='rm -i'
alias rot13='tr a-zA-Z n-za-mN-ZA-M'
alias screen-mail='screen -S mail -c ~/.screenrc-mail'
alias sqlitetmp='mkdir -p /tmp/sqlite && sudo mount tmpfs -t tmpfs /tmp/sqlite'
alias tmux='tmux -2'
alias ygcheese="python setup.py register -r yg sdist upload -r yg"
alias csvtable="column -s, -t | less -#2 -N -S"
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
    if [ "x$VIRTUAL_ENV" != "x" ]; then
        echo "[`basename $VIRTUAL_ENV`]"
    else
        echo ""
    fi
}

function cabal_sandbox_info() {
    cabal_files=(*.cabal(N))
    if [ $#cabal_files -gt 0 ]; then
        if [ -f cabal.sandbox.config ]; then
            echo "%{$fg[green]%}(HS:sandboxed)%{$reset_color%}"
        else
            echo "%{$fg[red]%}(HS:not-sandboxed)%{$reset_color%}"
        fi
    fi
}

GIT_PS1_SHOWDIRTYSTATE=true
export PROMPT='%B%(?..[%?] )%b%n@%U%m%u %F%B%{$fg[yellow]%}%~%f%{$reset_color%}%b % > '
export RPROMPT='%B$(__git_ps1 "(GIT:%s)")$(__hg_ps1)$(cabal_sandbox_info)%b %{$fg[green]%}$(__venv_ps1)%{$reset_color%}%'
#}}}

#{{{ Bindings
bindkey -e
bindkey \^U backward-kill-line
#}}}

#{{{ External scripts
if [[ -x `which virtualenvwrapper.sh` ]]; then
    source `which virtualenvwrapper.sh`
elif [[ -f /etc/bash_completion.d/virtualenvwrapper ]]; then
    source /etc/bash_completion.d/virtualenvwrapper
fi
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
export VIRTUAL_ENV_DISABLE_PROMPT=true
export LESS="-R"
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
