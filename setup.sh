#!/bin/bash

function link {
	ln -sf $HOME/src/dotfiles/$1 $HOME/$1
}

# for x in .bash .bashrc .vim .vimrc .Xdefaults .inputrc; do
for x in .vim .vimrc .Xdefaults .zshrc .git-prompt.sh .gitconfig .jsl.conf; do
	link $x
done
