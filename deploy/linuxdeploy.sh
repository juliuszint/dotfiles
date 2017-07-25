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

if [ ! -d ~/.vim/ftdetect ]; then
	echo "creating ftdetect directory"
	mkdir ~/.vim/ftdetect/
fi

if [ ! -d ~/.vim/syntax ]; then
	echo "creating syntax directory"
	mkdir ~/.vim/syntax/
fi

if [ ! -d ~/.vim/after ]; then
	echo "creating after directory"
	mkdir ~/.vim/after/
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
cp ./../vim/.vimrc ~/.vimrc

echo "overwriting ftdetect files"
cp ./../vim/vimfiles/ftdetect/hex.vim ~/.vim/ftdetect/hex.vim

# copy 
echo "overwriting syntax files"
cp ./../vim/vimfiles/after/syntax/c.vim ~/.vim/after/syntax/c.vim
cp ./../vim/vimfiles/syntax/hex.vim ~/.vim/syntax/hex.vim

echo "overwriting ftplugin files"
cp ./../vim/vimfiles/ftplugin/html.vim ~/.vim/after/ftplugin/html.vim

# copy vim colorschemes
echo "overwriting colorscheme"
cp ./../vim/vimfiles/vimcolors/visualstudio.vim ~/.vim/colors/visualstudio.vim
