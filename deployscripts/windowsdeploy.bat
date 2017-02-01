@echo off
copy /Y .\..\vimcolors\visualstudio.vim %HOMEDRIVE%%HOMEPATH%\vimfiles\colors\visualstudio.vim
copy /Y .\..\syntax\c.vim %HOMEDRIVE%%HOMEPATH%\vimfiles\after\syntax\c.vim
copy /Y .\..\.vimrc %HOMEDRIVE%%HOMEPATH%\.vimrc
copy /Y .\..\.vsvimrc %HOMEDRIVE%%HOMEPATH%\.vsvimrc 
