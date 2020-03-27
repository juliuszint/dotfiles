if exists("b:current_syntax")
    finish
endif

syn match agFilename               /^[^:]\S*/
syn match agLineNumber             /^[0-9]*:/ contains=agLineColumnNumberColon nextgroup=agColumnNumber
syn match agColumnNumber           /[0-9]*:/  contained contains=agLineColumnNumberColon
syn match agLineColumnNumberColon  /:/ contained
