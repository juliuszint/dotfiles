set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "visualstudio"

hi MyTagListFileName    guifg=NONE   guibg=NONE
hi MyTagListTagName     guifg=NONE   guibg=NONE
hi Search       guifg=#000000   guibg=#FFFB04

if version >= 700
  hi CursorLine     guifg=NONE guibg=#2F3239
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

if has("autocmd")
    :augroup cursorcolor
        :autocmd InsertLeave * hi Cursor guifg=#FFFFFF guibg=#FFA500
        :autocmd InsertEnter * hi Cursor guifg=#FFFFFF   guibg=#FFFFFF
    :augroup END
endif

hi Normal       guifg=#ffffff   guibg=#292A30
hi LineNr       guifg=#747478   guibg=NONE
hi CursorLineNr guifg=#ffffff   guibg=NONE
hi Visual       guifg=NONE   guibg=#264f78
hi Cursor       guifg=#FFFFFF   guibg=#FFA500
hi VertSplit    guifg=#292A30  guibg=#000000

hi ModeMsg      guifg=NONE   guibg=NONE
hi WildMenu     guifg=NONE   guibg=NONE
hi Question     guifg=NONE   guibg=NONE

hi StatusLine   guifg=#FFFFFF   guibg=#0071CC gui=bold
hi StatusLineNC guifg=NONE   guibg=#2d2d30 gui=bold
hi ColorColumn  guifg=NONE   guibg=#2F3239

hi Todo         guifg=NONE   guibg=NONE      gui=NONE
hi Error        guifg=NONE   guibg=#FF0000   gui=bold,underline
hi Note         guifg=NONE   guibg=#00FF00
hi WordUnderTheCursor       guifg=NONE   guibg=#353A3F
hi link IncSearch Search

hi NonText      guifg=#292A30   guibg=NONE
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
hi String   guifg=#FF8170 gui=NONE
hi Type     guifg=#FF7AB2 gui=NONE
hi Number   guifg=#A79DF7 gui=NONE
hi Constant guifg=#FF7AB2 gui=NONE
hi Comment  guifg=#7F8C98 guibg=NONE gui=italic
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
hi cTagsClass       	 guifg=#8AD1C3 guibg=NONE
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
hi link csString String
hi link csKeyword Type
hi link csClass cTagsClass
hi link csInterface cTagsEnumerationValue
hi link csEnum cTagsEnumerationValue
hi link csComment Comment
hi link csNumber Number
hi link csPreprocessor swiftPreproc
hi link csTypeParamName swiftTypePair
hi link csDelegateName csClass
hi link csStruct csInterface
hi csExcludedCode guifg=#7F8C98 guibg=NONE
hi csEnumMemberName guifg=#9CDCFE guibg=NONE

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
hi link NERDTreeDir Default
hi link NERDTreeOpenable Default
hi link NERDTreeClosable Default

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
"hi nunitTestIgnored guifg=#F4FF5B guibg=NONE
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
hi agFilename   guifg=#D94658 guibg=NONE
hi agLineNumber guifg=#7AAE3A guibg=NONE
hi agLineColumnNumberColon guifg=#6e6e6e guibg=NONE
hi link agColumnNumber agLineNumber

" dotnet test output
hi dotnetTestTotalTestLabel guifg=#8AE234 guibg=NONE
hi link dotnetTestPassedTestLabel dotnetTestTotalTestLabel
hi dotnetTestFailedTestLabel guifg=#FF5B5E guibg=NONE

hi link dotnetTestTotalTestValue Number
hi link dotnetTestPassedTestValue dotnetTestTotalTestValue
hi link dotnetTestFailedTestValue dotnetTestTotalTestValue

hi link dotnetStackTraceLoc dotnetTestFailedTestLabel

"msbuild
hi msbuildFilename guifg=#6e6e6e guibg=NONE gui=underline
hi msbuildErrorLevelError guifg=#FF5B5E guibg=NONE
hi msbuildErrorLevelWarning guifg=#FEFF5B guibg=NONE
hi link msbuildLocation msbuildFilename

"ultisnip
hi link snipSnippetHeaderKeyword Type
hi link snipSnippetFooterKeyword Type
hi link snipGlobalHeaderKeyword Type
hi link snipGlobalFooterKeyword Type
hi link snipMirror cTagsClass
hi link snipTabStopDefault Default
hi snipSnippetTrigger guifg=#C586C0 guibg=NONE
hi snipSnippetTrigger guifg=#C586C0 guibg=NONE
hi snipTabStop guifg=#9CDCFE guibg=NONE

"swift
hi swiftImport guifg=#FF7AB2 guibg=NONE
hi swiftTypeDefinition guifg=#FF7AB2 guibg=NONE
hi swiftDefinitionModifier guifg=#FF7AB2 guibg=NONE
hi swiftFuncDefinition guifg=#FF7AB2 guibg=NONE
hi swiftKeyword guifg=#FF7AB2 guibg=NONE
hi swiftVarDefinition guifg=#FF7AB2 guibg=NONE
hi swiftTypePair guifg=#BAF28F guibg=NONE
hi swiftTypeName guifg=#BAF28F guibg=NONE
hi swiftPreproc guifg=#FFA14F guibg=NONE
hi swiftComment guifg=#7F8C98 guibg=NONE gui=italic
hi swiftString guifg=#FF8170 guibg=NONE gui=italic
hi swiftDecimal guifg=#A79DF7 guibg=NONE gui=italic
hi link swiftLineComment swiftComment
hi link swiftType Default

" TURTLE
hi link ttlLabel cTagsClass

" Latex
hi link texStatement Constant
hi link texBeginEnd Constant
hi link texDocType Constant
hi texBeginEndName guifg=#A0D975 guibg=NONE
hi link texInputFile texBeginEndName

" sh
hi link shDerefSimple texBeginEndName
hi link shStatement Constant
hi link shSet Constant
hi link shRepeat Constant
hi link shCondition Constant
hi link shConditional Constant
hi link shVariable texBeginEndName

" Quickfix
hi link qfFileName csClassType
hi link qfLineNr Number
hi qfMsbuildCsError guifg=#FF5B5E guibg=NONE
hi qfMsbuildCsWarning guifg=#FEFF5B guibg=NONE

