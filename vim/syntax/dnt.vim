" Vim syntax file
" Language: dotnet test output
" Maintainer: Julius Zint
" Latest Revision: 19.07.2019

if exists("b:current_syntax")
  finish
endif

syn match dotnetTestTotalTestLabel '^Total tests:' nextgroup=dotnetTestTotalTestValue skipwhite
syn match dotnetTestTotalTestValue '\d\+' contained nextgroup=dotnetTestPassedTestLabel skipnl skipwhite
syn match dotnetTestPassedTestLabel 'Passed:' contained nextgroup=dotnetTestPassedTestValue skipwhite
syn match dotnetTestPassedTestValue '\d\+' contained nextgroup=dotnetTestFailedTestLabel skipnl skipwhite
syn match dotnetTestFailedTestLabel 'Failed:' contained nextgroup=dotnetTestFailedTestValue skipwhite
syn match dotnetTestFailedTestValue '\d\+' contained

syn match dotnetStackTraceLoc '\(/[A-Za-z0-9\.]\+\)\+:line \d\+' 
