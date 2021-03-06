#!/bin/bash

if [ ! -d ~/.vim/ ]; then
	mkdir ~/.vim/
fi


if [ ! -d ~/.vim/after ]; then
	mkdir ~/.vim/after/
fi

if [ ! -d ~/.vim/colors ]; then
	mkdir ~/.vim/colors/
fi

if [ ! -d ~/.vim/ftdetect ]; then
	mkdir ~/.vim/ftdetect/
fi

if [ ! -d ~/.vim/ftplugin ]; then
	mkdir ~/.vim/ftplugin/
fi

if [ ! -d ~/.vim/plugin ]; then
	mkdir ~/.vim/plugin/

fi

if [ ! -d ~/.vim/syntax ]; then
	mkdir ~/.vim/syntax/
fi

if [ ! -d ~/.vim/bundle ]; then
	mkdir ~/.vim/bundle/
fi

if [ ! -d ~/.vim/autoload ]; then
	mkdir ~/.vim/autoload/
fi


if [ ! -d ~/.vim/after/syntax ]; then
	mkdir ~/.vim/after/syntax/
fi

if [ ! -d ~/.vim/after/ftplugin ]; then
	mkdir ~/.vim/after/ftplugin/
fi

if [ ! -d ~/.vim/after/plugin ]; then
	mkdir ~/.vim/after/plugin/
fi

if [ ! -d ~/.vim/bundle/auto-pairs ]; then
	pushd ./
	cd ~/.vim/bundle/
	git clone https://github.com/jiangmiao/auto-pairs.git
	popd
fi

if [ ! -d ~/.vim/bundle/fzf.vim.vim ]; then
	pushd ./
	cd ~/.vim/bundle/
	git clone https://github.com/junegunn/fzf.vim.git
	popd
fi

if [ ! -d ~/.vim/bundle/nerdtree ]; then
	pushd ./
	cd ~/.vim/bundle/
	git clone https://github.com/scrooloose/nerdtree.git
	popd
fi

if [ ! -d ~/.vim/bundle/vim-devicons ]; then
	pushd ./
	cd ~/.vim/bundle/
	git clone https://github.com/ryanoasis/vim-devicons.git
	popd
fi

if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

cp ./../vim/vimfiles/after/ftplugin/xml.vim ~/.vim/after/ftplugin/xml.vim
cp ./../vim/vimfiles/after/ftplugin/html.vim ~/.vim/after/ftplugin/html.vim
cp ./../vim/vimfiles/after/plugin/my_nerdtree.vim ~/.vim/after/plugin/my_nerdtree.vim
cp ./../vim/vimfiles/after/syntax/c.vim ~/.vim/after/syntax/c.vim
cp ./../vim/vimfiles/after/syntax/cs.vim ~/.vim/after/syntax/cs.vim
cp ./../vim/vimfiles/after/syntax/nerdtree.vim ~/.vim/after/syntax/nerdtree.vim

cp ./../vim/vimfiles/colors/visualstudio.vim ~/.vim/colors/visualstudio.vim
cp ./../vim/vimfiles/colors/caseymuratori.vim ~/.vim/colors/caseymuratori.vim

cp ./../vim/vimfiles/ftdetect/hex.vim ~/.vim/ftdetect/hex.vim

cp ./../vim/vimfiles/ftplugin/html.vim ~/.vim/ftplugin/html.vim

cp ./../vim/vimfiles/plugin/WordUnderTheCursor.vim ~/.vim/plugin/WordUnderTheCursor.vim
cp ./../vim/vimfiles/plugin/bclose.vim ~/.vim/plugin/bclose.vim

cp ./../vim/vimfiles/syntax/hex.vim ~/.vim/syntax/hex.vim
cp ./../vim/vimfiles/syntax/slide.vim ~/.vim/syntax/slide.vim
cp ./../vim/vimfiles/syntax/nunit.vim ~/.vim/syntax/nunit.vim
cp ./../vim/vimfiles/syntax/qf.vim ~/.vim/syntax/qf.vim

cp ./../vim/.vimrc ~/.vimrc
cp ./../vim/.gvimrc ~/.gvimrc

