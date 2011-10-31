function count {
	ls -1AU $* | wc -l
}

function ora10g {
	sqlplus $1/$1@ora10g
}

function ora11 {
	sqlplus $1/$1@ora11
}

function orapd2 {
	sqlplus $1/$1@PADPDEV2.sportex.com
}

function _git_all_and {
	git $1 && git submodule foreach "git $1"
}

function _git_all_or {
	git $1; git submodule foreach "git $1 ||:"
}

function pull_all {
	_git_all_and pull
}

function push_all {
	git submodule foreach "git push" && git push
}

function branch_all {
	_git_all_or branch
}

function status_all {
	_git_all_or status
}

function rc {
	rlwrap -c -b '(){}[],+=&^%$#@"";|\' rc -l $*
}
