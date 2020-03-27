" Vim syntax file
" Language: nunit console runner output
" Maintainer: Julius Zint
" Latest Revision: 19.07.2019

if exists("b:current_syntax")
  finish
endif

syn match nunitTestAssemblyForOutput '^=>\s.*'
syn region nunitTestSkipped start='^\d\+) Skipped : ' end='\n\n'
syn region nunitTestIgnored start='^\d\+) Ignored : ' end='\n\n'
syn region nunitTestFailed  start='^\d\+) Failed : ' end='\n\n'
syn region nunitTestError   start='^\d\+) Error : ' end='\n\n'

syn match nunitSectionAttribute '\s\+\(\w\|\s\|-\)\+:\s' contained
syn region nunitRunEnv start='^Runtime Environment' end='\n\n' contains=nunitSectionAttribute
syn region nunitRunSettings start='^Run Settings' end='\n\n' contains=nunitSectionAttribute
syn region nunitRunSettings start='^Test Run Summary' end='\n\n' contains=nunitSectionAttribute

