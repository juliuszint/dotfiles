@echo off

IF NOT EXIST %HOMEDRIVE%%HOMEPATH%\vimfiles (
	echo "creating vim directory"
	mkdir %HOMEDRIVE%%HOMEPATH%\vimfiles
)

IF NOT EXIST %HOMEDRIVE%%HOMEPATH%\vimfiles\bundle (
	echo "creating bundle directory"
	mkdir %HOMEDRIVE%%HOMEPATH%\vimfiles\bundle
)

IF NOT EXIST %HOMEDRIVE%%HOMEPATH%\vimfiles\autoload (
	echo "creating autoload directory"
	mkdir %HOMEDRIVE%%HOMEPATH%\vimfiles\autoload
)

IF NOT EXIST %HOMEDRIVE%%HOMEPATH%\vimfiles\colors (
	echo "creating colors directory"
	mkdir %HOMEDRIVE%%HOMEPATH%\vimfiles\colors
)

IF NOT EXIST %HOMEDRIVE%%HOMEPATH%\vimfiles\after (
	echo "creating after directory"
	mkdir %HOMEDRIVE%%HOMEPATH%\vimfiles\after
)

IF NOT EXIST %HOMEDRIVE%%HOMEPATH%\vimfiles\after\syntax (
	echo "creating after.syntax directory"
	mkdir %HOMEDRIVE%%HOMEPATH%\vimfiles\after\syntax
)

IF NOT EXIST %HOMEDRIVE%%HOMEPATH%\vimfiles\autoload\pathogen.vim (
	echo "downloading pathongen vim plugin"
	bitsadmin.exe /transfer "pathogenvim" https://tpo.pe/pathogen.vim %HOMEDRIVE%%HOMEPATH%\vimfiles\autoload\pathogen.vim
)

IF NOT EXIST %HOMEDRIVE%%HOMEPATH%\vimfiles\bundle\ctrlp.vim (
	echo "downloading ctrlp vim plugin"
	pushd .\
	cd  %HOMEDRIVE%%HOMEPATH%\vimfiles\bundle\
	git clone https://github.com/ctrlpvim/ctrlp.vim.git
	popd
)

echo "overwriting bash_profile file"
copy /Y .\..\.bash_profile_gitwindows %HOMEDRIVE%%HOMEPATH%\.bash_profile

echo "overwriting vimrc file"
copy /Y .\..\.vimrc %HOMEDRIVE%%HOMEPATH%\.vimrc

echo "overwriting vsvimrc file"
copy /Y .\..\.vsvimrc %HOMEDRIVE%%HOMEPATH%\.vsvimrc 

echo "overwriting syntax files"
copy /Y .\..\syntax\c.vim %HOMEDRIVE%%HOMEPATH%\vimfiles\after\syntax\c.vim

echo "overwriting colorscheme files"
copy /Y .\..\vimcolors\visualstudio.vim %HOMEDRIVE%%HOMEPATH%\vimfiles\colors\visualstudio.vim
