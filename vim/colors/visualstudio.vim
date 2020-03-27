set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "visualstudio"

hi MyTagListFileName    guifg=NONE   guibg=NONE
hi MyTagListTagName     guifg=NONE   guibg=NONE
hi Search       guifg=#000000   guibg=#C4A002

if version >= 700
  hi CursorLine     guifg=NONE guibg=#020202
  hi CursorColumn   guibg=NONE
  hi link MatchParen Search

  hi TabLine        guifg=NONE     guibg=NONE
  hi TabLineFill    guifg=NONE
  hi TabLineSel     guifg=NONE     guibg=NONE gui=bold

  hi Pmenu          guifg=NONE     guibg=#5E5E5E
  hi PmenuSel       guifg=NONE     guibg=#0071CC
endif

hi Title        guifg=NONE   gui=NONE
hi Underlined   guifg=NONE   gui=underline

hi Normal       guifg=#dcdcdc   guibg=#1e1e1e
hi LineNr       guifg=#6e6e6e   guibg=NONE
hi CursorLineNr guifg=#2b91af   guibg=NONE
hi Visual       guifg=NONE   guibg=#264f78
hi Cursor       guifg=#0F0F0F   guibg=#DFDFDF
hi VertSplit    guifg=#68217A  guibg=#68217A

hi ModeMsg      guifg=NONE   guibg=NONE
hi WildMenu     guifg=NONE   guibg=NONE
hi Question     guifg=NONE   guibg=NONE

hi StatusLine   guifg=#FFFFFF   guibg=#0071CC gui=bold
hi StatusLineNC guifg=NONE   guibg=#2d2d30 gui=bold
hi ColorColumn  guifg=NONE   guibg=#2d2d30

hi Todo         guifg=NONE   guibg=NONE      gui=NONE
hi Error        guifg=NONE   guibg=#FF0000   gui=bold,underline
hi Note         guifg=NONE   guibg=#00FF00
hi WordUnderTheCursor       guifg=NONE   guibg=#014343
hi link IncSearch Search

hi NonText      guifg=NONE   guibg=NONE
hi Folded       guifg=NONE   guibg=NONE
hi Folded       guifg=NONE   guibg=NONE
hi FoldColumn   guifg=NONE   guibg=NONE

hi Typedef      guifg=NONE   gui=NONE
hi Identifier   guifg=NONE   gui=NONE
hi Function     guifg=NONE   gui=NONE
hi Operator     guifg=NONE   gui=NONE
hi SpecialKey	guifg=NONE   guibg=NONE
hi Special      guifg=NONE   guibg=NONE

" common syntax highlighting
hi String   guifg=#d69d85 gui=NONE
hi Type     guifg=#569cd6 gui=NONE
hi Number   guifg=#b5cea8 gui=NONE
hi Constant guifg=#569cd6 gui=NONE
hi Comment  guifg=#57a64a guibg=NONE gui=NONE
hi Define   guifg=#9b9b9b gui=NONE
hi ExtraWhitespace guifg=NONE guibg=#FF5B5E

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

hi link cCharacter String
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
hi link cConditional cType
hi link cRepeat      cType
hi csPreCondit guifg=#9b9b9b guibg=NONE

" HTML / CSS highlighting
hi htmlTag   		guifg=#808080 guibg=NONE
hi htmlArg   		guifg=#9cdcfe guibg=NONE
hi htmlCommentError 	guifg=NONE    guibg=NONE

hi cssTagName    	guifg=#D7BA7D guibg=NONE
hi cssBoxProp           guifg=#9CDCFE guibg=NONE
hi cssMediaProp         guifg=#9CDCFE guibg=NONE
hi cssPositioningAttr   guifg=#d69d85 gui=NONE

hi link htmlSpecialChar Type
hi link htmlSpecialTagName Type
hi link htmlTagName Type
hi link htmlEndTag htmlTag

hi link cssFontProp cssBoxProp
hi link cssPseudoClassId cssTagName
hi link cssPositioningProp cssBoxProp
hi link cssIdentifier cssTagName
hi link cssClassname cssTagName
hi link cssClassnameDot cssTagName
hi link cssBackgroundProp cssBoxProp
hi link cssBorderProp cssBoxProp
hi link cssTransitionProp cssBoxProp
hi link cssColorProp cssBoxProp

" Python highlighting
hi link pythonInclude Type
hi link pythonException Type
hi link pythonExceptions cTagsClass
hi link pythonStatement Type
hi link pythonBuiltin Type
hi link pythonConditional Type
hi link pythonRepeat Type

" C# highlighting
hi link csTodo Comment
hi link csUnspecifiedStatement Type
hi link csUnspecifiedKeyword Type
hi link csException Type
hi link csRepeat Type
hi link csConditional Type
hi link csLabel Type
hi link csAsync Type
hi link csNew Constant
hi link csIsAs Constant
hi link csVar Constant
hi link csIsType Default
hi link csType Constant
hi link csNewType Default
hi link csEndColon Default
hi link csLogicSymbols Default
hi link csXamarinType cTagsClass
hi link csClassType cTagsClass
hi link csContextualStatement Type
hi link csUnsupportedStatement Type
hi link csLinq Type
hi link csXmlComment Comment
hi link csXmlTag Comment
hi link csEnumType cTagsEnumerationValue
hi link csInterfaceType csEnumType
hi link csStructType csClassType
hi link csCharacter String

" Java highlighting
hi link javaOperator Type
hi link javaStatement Type
hi link javaRepeat Type
hi link javaTypedef Type
hi link javaDocTags Comment
hi link javaDocParam Comment
hi link javaCommentTitle Comment
hi link javaExceptions Type
hi link javaBranch Type

" Json highlighting
hi jsonKeyword	    guifg=#D7BA7D      guibg=NONE

" Resharper XML Highlighting
hi xmlTag			guifg=#DADADA      guibg=NONE
hi xmlTagName    	guifg=#ADD8E6      guibg=NONE
hi xmlAttribPunct 	guifg=#DCDCDC      guibg=NONE
hi xmlAttrib		guifg=#EE82EE      guibg=NONE
hi link xmlEndTag xmlTagName
hi link xmlNamespace xmlAttrib
hi link xmlString String
hi link xmlTag xmlTagName

" Diff
hi DiffChange   guifg=NONE      guibg=NONE   gui=bold
hi DiffText     guifg=NONE      guibg=NONE   gui=bold
hi DiffAdd      guifg=NONE      guibg=NONE   gui=bold
hi DiffDelete   guifg=NONE      guibg=NONE   gui=bold

" Hex Files
hi link hexAddress cTagsClass
hi link hexOctetGroup Normal
hi link hexAscii String

" slides
hi slideSeperator guifg=#672179     guibg=#2d2d30
hi link slideComment Comment
hi link slideBlockComment Comment

" NERDTree
hi link NERDTreeHelp Comment
hi link NERDTreeCWD Number
hi link NERDTreeUp Constant
hi NERDTreeDir guifg=#A6CA54 guibg=NONE
hi link NERDTreeOpenable Default
hi link NERDTreeClosable NERDTreeOpenable
hi NERDTreeCsharpDesignerFile guifg=#7a7a7a gui=NONE
hi NERDTreeCsharpSolutionFile guifg=#CAB4FA gui=NONE
hi NERDTreeCsharpProjectFile guifg=#8FC1FF gui=NONE

" Quickfix
hi qfFileName  guifg=#CAB4FA guibg=NONE
hi qfCsError   guifg=#FF5B5E guibg=NONE
hi qfCsWarning guifg=#FEFF5B guibg=NONE

" git
hi diffAdded   guifg=#8AE234 guibg=NONE
hi diffRemoved guifg=#FF5B5E guibg=NONE
hi diffLine guifg=#06989A guibg=NONE
hi link diffSubname Default
hi link diffFile Default
hi link diffIndexLine Default

" nunit output
hi nunitSectionHeader guifg=#34E2E2 guibg=NONE
hi nunitTestFailed guifg=#FF5B5E guibg=NONE
hi nunitTestIgnored guifg=#F4FF5B guibg=NONE
hi nunitSectionAttribute guifg=#5BFF80  guibg=NONE
hi link nunitTestError nunitTestFailed
hi link nunitTestAssemblyForOutput nunitSectionHeader

" java
hi link javaConditional Constant

" vimscript
hi vimFuncName guifg=#DCDCAA guibg=NONE
hi vimOption guifg=#C586C0 guibg=NONE
hi vimVar guifg=#9CDCFE guibg=NONE
hi link vimcommand Type
hi link vimSetSep Default
hi link vimIsCommand Type
hi link vimHiGroup cTagsClass

"ag
hi link agFilename NERDTreeDir
hi agLineNumber guifg=#E8E366 guibg=NONE
hi link agColumnNumber agLineNumber
