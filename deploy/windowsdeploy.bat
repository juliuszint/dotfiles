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
	echo "creating ftdetect directory"
	mkdir %HOMEDRIVE%%HOMEPATH%\vimfiles\ftdetect
)

IF NOT EXIST %HOMEDRIVE%%HOMEPATH%\vimfiles\after (
	echo "creating syntax directory"
	mkdir %HOMEDRIVE%%HOMEPATH%\vimfiles\syntax
)

IF NOT EXIST %HOMEDRIVE%%HOMEPATH%\vimfiles\after (
	echo "creating after directory"
	mkdir %HOMEDRIVE%%HOMEPATH%\vimfiles\after
)

IF NOT EXIST %HOMEDRIVE%%HOMEPATH%\vimfiles\after\syntax (
	echo "creating after.syntax directory"
	mkdir %HOMEDRIVE%%HOMEPATH%\vimfiles\after\syntax
)

IF NOT EXIST %HOMEDRIVE%%HOMEPATH%\vimfiles\after\ftplugin (
	echo "creating after.ftplugin directory"
	mkdir %HOMEDRIVE%%HOMEPATH%\vimfiles\after\ftplugin
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
IF NOT EXIST %HOMEDRIVE%%HOMEPATH%\vimfiles\bundle\vim-airline (
	echo "downloading ctrlp vim plugin"
	pushd .\
	cd  %HOMEDRIVE%%HOMEPATH%\vimfiles\bundle\
	git clone https://github.com/vim-airline/vim-airline.git
	popd
)

echo "overwriting bash_profile file"
copy /Y .\..\.bash_profile_gitwindows %HOMEDRIVE%%HOMEPATH%\.bash_profile

echo "overwriting vimrc file"
copy /Y .\vim\.vimrc %HOMEDRIVE%%HOMEPATH%\.vimrc

echo "overwriting vsvimrc file"
copy /Y .\..\.vsvimrc %HOMEDRIVE%%HOMEPATH%\.vsvimrc 

echo "overwriting ftdectect file"
copy /Y .\..\vim\vimfiles\ftdetect\hext.vim %HOMEDRIVE%%HOMEPATH%\vimfiles\ftdetect\c.vim

echo "overwriting syntax files"
copy /Y .\..\vim\vimfiles\after\syntax\c.vim %HOMEDRIVE%%HOMEPATH%\vimfiles\after\syntax\c.vim
copy /Y .\..\vim\vimfiles\syntax\hex.vim %HOMEDRIVE%%HOMEPATH%\vimfiles\after\syntax\hex.vim

echo "overwriting ftplugin files"
copy /Y .\..vim\vimfiles\ftplugin\html.vim %HOMEDRIVE%%HOMEPATH%\vimfiles\after\ftplugin\html.vim

echo "overwriting colorscheme files"
copy /Y .\..\vim\vimfiles\vimcolors\visualstudio.vim %HOMEDRIVE%%HOMEPATH%\vimfiles\colors\visualstudio.vim
