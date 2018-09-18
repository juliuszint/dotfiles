" Vim syntax file
" Language:	Quickfix window
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Jan 15

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" A bunch of useful C keywords
syn match	qfFileName      	"^[^|]*" nextgroup=qfStartSeparator
syn match	qfStartSeparator	"|" nextgroup=qfLineNr contained
syn match	qfLineNr        	"[^|]*" nextgroup=qfEndSeparator contained
syn match	qfEndSeparator  	"|" nextgroup=qfCsError,qfCsWarning contained
syn match	qfCsError       " error[^:]*:" contained
syn match	qfCsWarning     " warning[^:]*:" contained

" The default highlighting.
hi def link qfFileName	Directory
hi def link qfLineNr	LineNr

let b:current_syntax = "qf"

" vim: ts=8
