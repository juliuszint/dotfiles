set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "caseymuratori"

" Taglist colors
hi MyTagListFileName    guifg=NONE   guibg=NONE
hi MyTagListTagName     guifg=NONE   guibg=NONE

if version >= 700
  hi CursorLine     guibg=#002030
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

hi Normal       guifg=#A08563   guibg=#161616
hi LineNr       guifg=#7F7F7F   guibg=NONE
hi CursorLineNr guifg=#2b91af   guibg=NONE
hi Visual       guifg=NONE   guibg=#264f78
hi Cursor       guifg=NONE   guibg=#40FF40

hi ModeMsg      guifg=NONE   guibg=NONE
hi WildMenu     guifg=NONE   guibg=NONE
hi IncSearch    guibg=NONE   guifg=NONE
hi Question     guifg=NONE   guibg=NONE

hi StatusLine   guifg=NONE   guibg=#2d2d30 gui=bold
hi StatusLineNC guifg=NONE   guibg=#2d2d30 gui=bold
hi VertSplit    guifg=NONE   guibg=NONE    gui=NONE
hi ColorColumn  guifg=NONE   guibg=#2d2d30

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
hi Search       guifg=NONE   guibg=#623003   gui=NONE
hi SpecialKey	guifg=NONE   guibg=NONE
hi Special      guifg=NONE   guibg=NONE

hi Pmenu        guifg=NONE   guibg=#363636
hi PmenuSel     guifg=NONE   guibg=#623003

" common syntax highlighting
hi String       	 guifg=#6b8e23 gui=NONE
hi Type         	 guifg=#cd950c gui=NONE
hi Constant     	 guifg=#6B8E23 gui=NONE
hi Comment      	 guifg=#7D7D7D guibg=NONE gui=NONE
hi Define            guifg=#DAB98F gui=NONE
hi Number       	 guifg=NONE    gui=NONE

" DAB98F

hi link StorageClass Type                                    " voltaile
hi link Include Define
hi link PreProc Define
hi link Boolean Type
hi link float Number
hi link Statement Type 

"C
hi link cConditional Type
hi link cRepeat Type
hi link cLabel Type
hi link cStatement Type

"NERDtree
hi link NERDTreeDir Comment
hi link NERDTreeUp Type
hi link NERDTreeCWD Type
hi link NERDTreeDirSlash Comment
hi link NERDTreeOpenable Comment
hi link NERDTreeClosable Comment

" C# highlighting
hi link csUnspecifiedStatement Type
hi link csException Type
hi link csRepeat Type
hi link csConditional Type
hi link csLabel Type
hi link csContextualStatement Type
hi link csUnsupportedStatement Type
hi link csXmlComment Comment
hi link csXmlTag Comment
hi link xmlEndTag Comment
hi link xmlTag Comment
hi link xmlEqual Comment
hi link csPreCondit Define
hi link csNumber Constant

" Hex Files
hi link hexAddress cTagsClass
hi link hexOctetGroup Normal
hi link hexAscii String

" slides
hi slideSeperator guifg=#672179     guibg=#2d2d30
hi link slideComment Comment
hi link slideBlockComment Comment

