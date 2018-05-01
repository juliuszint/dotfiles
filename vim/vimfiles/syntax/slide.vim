" Vim syntax file

if exists("b:current_syntax")
  finish
endif

syn match slideSeperator '^##.*'
syn match slideComment '^//.*'
syn region slideBlockComment start=/\/\*/ end=/\*\//
