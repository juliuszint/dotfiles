#!/bin/bash

if [ ! -d ~/.vim/ ]; then
	echo "creating vim directory"
	mkdir ~/.vim/
fi

if [ ! -d ~/.vim/bundle ]; then
	echo "creating bundle directory"
	mkdir ~/.vim/bundle/
fi

if [ ! -d ~/.vim/autoload ]; then
	echo "creating autoload directory"
	mkdir ~/.vim/autoload/
fi

if [ ! -d ~/.vim/colors ]; then
	echo "creating colors directory"
	mkdir ~/.vim/colors/
fi

if [ ! -d ~/.vim/after/syntax ]; then
	echo "creating syntax directory"
	mkdir ~/.vim/after/syntax/
fi

if [ ! -d ~/.vim/bundle/CSApprox ]; then
	echo "downloading CSApprox plugin"
	pushd ./
	cd ~/.vim/bundle/
	git clone https://github.com/vim-scripts/CSApprox
	popd
fi
if [ ! -d ~/.vim/bundle/TagHighlight ]; then
	echo "downloading TagHighligh plugin"
	pushd ./
	cd ~/.vim/bundle/
	git clone https://github.com/vim-scripts/TagHighlight.git
	popd
fi

if [ ! -d ~/.vim/bundle/ctrlp.vim ]; then
	echo "downloading CtrlP plugin"
	pushd ./
	cd ~/.vim/bundle/
	git clone https://github.com/ctrlpvim/ctrlp.vim.git 
	popd
fi

if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
	echo downloading pathogen vim plugin
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# copy vimrc file
echo "overwriting rc file"
cp ./../.vimrc ~/.vimrc

# copy vim colorschemes
echo "overwriting colorscheme"
cp ./../vimcolors/visualstudio.vim ~/.vim/colors/visualstudio.vim

# copy 
echo "overwriting syntax files"
cp ./../after/syntax/c.vim ~/.vim/after/syntax/c.vim



