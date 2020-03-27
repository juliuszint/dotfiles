" Vim syntax file
" Language: Hexdump
" Maintainer: Julius Zint
" Latest Revision: 15.04.2017

if exists("b:current_syntax")
  finish
endif

" number of octets per line : 16
" number of octets per group: 2
syn match hexAddress '^\x\{8}:'
syn match hexAscii '.\{16}$'
syn match hexOctetGroup ' \x\{2}' contains=hexAscii
