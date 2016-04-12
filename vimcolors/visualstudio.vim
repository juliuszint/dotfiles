set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

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

hi StatusLine   guifg=NONE   guibg=NONE gui=bold
hi StatusLineNC guifg=NONE   guibg=NONE gui=bold
hi VertSplit    guifg=NONE   guibg=NONE gui=NONE

hi String       guifg=#d69d85   gui=NONE
hi Number       guifg=#b5cea8   gui=NONE
hi Float        guifg=#b5cea8   gui=NONE
hi Constant     guifg=#569cd6   gui=NONE
hi Boolean      guifg=#569cd6   gui=NONE

hi PythonBuiltin guifg=#569cd6 guibg=NONE

hi Comment      guifg=#57a64a   guibg=NONE gui=NONE
hi NonText      guifg=NONE   guibg=NONE
hi Folded       guifg=NONE   guibg=NONE
hi Folded       guifg=NONE   guibg=NONE
hi FoldColumn   guifg=NONE   guibg=NONE

hi Statement    guifg=#569cd6   gui=NONE
hi Type         guifg=#569cd6   gui=NONE
hi Structure    guifg=#4ec9b0   gui=NONE
hi Typedef      guifg=NONE   gui=NONE
hi StorageClass guifg=NONE   gui=NONE
hi Identifier   guifg=NONE   gui=NONE
hi Function     guifg=NONE   gui=NONE
hi Repeat       guifg=NONE   gui=NONE
hi Conditional  guifg=NONE  gui=NONE
hi Operator     guifg=NONE   gui=NONE

hi PreProc      guifg=NONE   gui=NONE
hi Define       guifg=NONE   gui=NONE
hi Include      guifg=#569cd6   gui=NONE

hi Error        guifg=NONE   guibg=NONE   gui=bold,underline
hi Todo         guifg=NONE   guibg=NONE   gui=NONE
hi Search       guifg=NONE   guibg=NONE   gui=NONE
hi SpecialKey	guifg=NONE   guibg=NONE
hi Special      guifg=NONE   guibg=NONE

hi cStructure   guifg=#569cd6   guibg=NONE   
hi cppStructure   guifg=#569cd6   guibg=NONE   

" Diff
hi DiffChange   guifg=NONE      guibg=NONE   gui=bold
hi DiffText     guifg=NONE      guibg=NONE   gui=bold
hi DiffAdd      guifg=NONE      guibg=NONE   gui=bold
hi DiffDelete   guifg=NONE      guibg=NONE   gui=bold

" set guifont=Consolas\ for\ Powerline\ FixedD\ 11

