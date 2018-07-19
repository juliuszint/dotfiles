" Vim syntax file
" Language: nunit console runner output
" Maintainer: Julius Zint
" Latest Revision: 19.07.2019

if exists("b:current_syntax")
  finish
endif

syn match nunitTestAssemblyForOutput '^=>\s.*'
syn match nunitTestSkipped '^\d\+) Skipped : \_.\{-}\n\s*\n'
syn match nunitTestIgnored '^\d\+) Ignored : \_.\{-}\n\s*\n'
syn match nunitTestFailed '^\d\+) Failed : \_.\{-}\n\n'
syn match nunitTestError '^\d\+) Error : \_.\{-}\n\n'

syn match nunitSectionAttribute '\s\+\(\w\|\s\|-\)\+:\s' contained
syn region nunitRunEnv start='^Runtime Environment' end='\n\n' contains=nunitSectionAttribute
syn region nunitRunSettings start='^Run Settings' end='\n\n' contains=nunitSectionAttribute
syn region nunitRunSettings start='^Test Run Summary' end='\n\n' contains=nunitSectionAttribute

