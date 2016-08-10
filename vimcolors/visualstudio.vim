set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "visualstudio"

" Taglist colors
hi MyTagListFileName    guifg=NONE   guibg=NONE
hi MyTagListTagName     guifg=NONE   guibg=NONE

if version >= 700
  hi CursorLine     guibg=#0f0f0f
  hi CursorColumn   guibg=NONE
  hi MatchParen     guifg=NONE     guibg=#133f71

  hi TabLine        guifg=NONE     guibg=NONE
  hi TabLineFill    guifg=NONE
  hi TabLineSel     guifg=NONE     guibg=NONE gui=bold

  hi Pmenu          guifg=NONE     guibg=NONE
  hi PmenuSel       guifg=NONE     guibg=NONE
endif

hi Title        guifg=NONE   gui=NONE
hi Underlined   guifg=NONE   gui=underline

hi Normal       guifg=#c8c8c8   guibg=#1e1e1e
hi LineNr       guifg=#2b91af   guibg=NONE 
hi CursorLineNr guifg=#2b91af   guibg=NONE
hi Visual       guifg=NONE   guibg=#264f78
hi Cursor       guifg=NONE   guibg=#ababab

hi ModeMsg      guifg=NONE   guibg=NONE
hi WildMenu     guifg=NONE   guibg=NONE
hi IncSearch    guibg=NONE   guifg=NONE
hi Question     guifg=NONE   guibg=NONE

hi StatusLine   guifg=NONE   guibg=#2d2d30 gui=bold
hi StatusLineNC guifg=NONE   guibg=#2d2d30 gui=bold
hi VertSplit    guifg=NONE   guibg=NONE    gui=NONE

hi NonText      guifg=NONE   guibg=NONE
hi Folded       guifg=NONE   guibg=NONE
hi Folded       guifg=NONE   guibg=NONE
hi FoldColumn   guifg=NONE   guibg=NONE

hi Typedef      guifg=NONE   gui=NONE
hi Identifier   guifg=NONE   gui=NONE
hi Function     guifg=NONE   gui=NONE
hi Operator     guifg=NONE   gui=NONE

hi Error        guifg=NONE   guibg=#FF0000   gui=bold,underline
hi Todo         guifg=NONE   guibg=NONE      gui=NONE
hi Note         guifg=NONE   guibg=#00FF00
hi Search       guifg=NONE   guibg=#113d6f   gui=NONE
hi SpecialKey	guifg=NONE   guibg=NONE
hi Special      guifg=NONE   guibg=NONE

" common syntax highlighting
hi String       	 guifg=#d69d85 gui=NONE
hi Type         	 guifg=#569cd6 gui=NONE
hi Number       	 guifg=#b5cea8 gui=NONE
hi Constant     	 guifg=#569cd6 gui=NONE
hi Comment      	 guifg=#57a64a guibg=NONE gui=NONE
hi Define                guifg=#9b9b9b gui=NONE

hi link StorageClass Type                                    " voltaile
hi link Include Define
hi link PreProc Define
hi link Boolean Type
hi link float Number
hi link Statement Type 

" C/C++ Syntax highlighting with ctags 
hi cFormat               guifg=#80ff80 guibg=NONE
hi cTagsNamespace   	 guifg=#add8e6 guibg=NONE
hi cStructure       	 guifg=#569cd6 guibg=NONE   
hi cTagsDefinedName 	 guifg=#bd63c5 guibg=NONE
hi cTagsClass       	 guifg=#4ec9b0 guibg=NONE
hi cTagsMember      	 guifg=#dda0dd guibg=NONE
hi cTagsEnumerationValue guifg=#b8d7a3 guibg=NONE

hi link cTagsUnion cTagsClass
hi link cLabel Type
hi link CTagsGlobalVariable Normal
hi link cUserLabel Type
hi link cTagsStructure cTagsClass
hi link cDefine      Define
hi link cStatement   Type
hi link cppStatement Type
hi link cppStructure Type
hi link cTagsType cTagsClass
hi link cOperator cType
hi link cTagsEnumeratorName cTagsClass
hi link cPreCondit cDefine
hi link cConditional cType
hi link cRepeat      cType

" HTML / CSS highlighting
hi htmlTag   		guifg=#808080  guibg=NONE
hi htmlTag   		guifg=#808080  guibg=NONE
hi htmlArg   		guifg=#9cdcfe  guibg=NONE
hi htmlCommentError 	guifg=NONE     guibg=NONE

hi link htmlTagName Type
hi link htmlEndTag htmlTag

" Python highlighting
hi link pythonInclude Type
hi link pythonException Type
hi link pythonExceptions cTagsClass
hi link pythonStatement Type
hi link pythonBuiltin Type
hi link pythonConditional Type
hi link pythonRepeat Type

" Diff
hi DiffChange   guifg=NONE      guibg=NONE   gui=bold
hi DiffText     guifg=NONE      guibg=NONE   gui=bold
hi DiffAdd      guifg=NONE      guibg=NONE   gui=bold
hi DiffDelete   guifg=NONE      guibg=NONE   gui=bold

