#!/bin/sh

set -e

EMACS_HOME=${HOME}/.emacs.d
EMACS_HOME_BACKUP=${EMACS_HOME}-$(date +%s)

if [ -d ${EMACS_HOME} ]
then
    rm -rf ${EMACS_HOME_BACKUP}
    cp -R ${EMACS_HOME} ${EMACS_HOME_BACKUP}
else
    mkdir -p ${EMACS_HOME}
fi

for f in init.el pkgs.el defuns.el themes.el custom.el ${EMACS_EXTRAS}
do
    curl -s https://raw.githubusercontent.com/lbolla/dotfiles/master/emacs/.emacs.d/$f -o ~/.emacs.d/$f
done
