#!/bin/bash

function link {
	ln -sf $HOME/src/dotfiles/$1 $HOME/
}

for x in .bash .bashrc .vim .vimrc .Xdefaults .zshrc .git-prompt.sh .gitconfig .jsl.conf .ghc .sqshrc; do
	link $x
done
