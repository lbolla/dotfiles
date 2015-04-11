#!/bin/bash

function link {
	ln -sf $HOME/src/dotfiles/$1 $HOME/$1
}

#for x in .bash .bashrc .vim .vimrc .Xdefaults .zshrc .git-prompt.sh .gitconfig .jsl.conf .ghc .sqshrc .config/ipython .xmonad .tmux.conf .pyrc .pdbrc.py; do
for x in .git-prompt.sh; do
	link $x
done
