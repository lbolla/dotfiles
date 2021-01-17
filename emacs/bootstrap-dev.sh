#!/bin/sh

set -e

EMACS_HOME=${HOME}/.emacs.d

if [ -d ${EMACS_HOME} ]
then
    rm -rf ${EMACS_HOME}-old
    mv ${EMACS_HOME} ${EMACS_HOME}-old
fi

mkdir ${EMACS_HOME}
for f in init.el pkgs.el defuns.el themes.el custom.el
do
    curl -s https://raw.githubusercontent.com/lbolla/dotfiles/master/emacs/.emacs.d/$f -o ~/.emacs.d/$f
done
