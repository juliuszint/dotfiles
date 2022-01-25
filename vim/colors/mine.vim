set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mine"

"                                  Vim-Editor
" =============================================================================
hi Default		guifg=#ffffff guibg=NONE
hi Search		guifg=#000000 guibg=#fffb04
hi CursorLine		guifg=NONE    guibg=#212121 gui=NONE cterm=NONE term=NONE
hi CursorLineNr		guifg=#ffffff cterm=NONE                        term=NONE
hi Pmenu		guifg=NONE    guibg=#5E5E5E
hi PmenuSel		guifg=NONE    guibg=#0071CC
hi Normal		guifg=#ffffff guibg=#232627
hi LineNr		guifg=#555555
hi Visual		guifg=NONE    guibg=#264f78
hi Cursor		guifg=#FFFFFF guibg=#ff2a62
hi VertSplit		guifg=#232627 guibg=#141414
hi Note			guifg=NONE    guibg=#00ff00
hi StatusLine		guifg=#ffffff guibg=#0071cc gui=bold cterm=bold term=bold
hi StatusLineNC		guifg=NONE    guibg=#2d2d30 gui=bold cterm=bold term=bold
hi ColorColumn		guifg=NONE    guibg=#2f3239
hi NonText		guifg=#404040 guibg=NONE
hi SpecialKey		guifg=#7f8c98
hi iCursor		guifg=#ffffff	guibg=#11d116
hi nCursor		guifg=#ffffff	guibg=#ffb846
hi TODO			guifg=NONE    guibg=NONE
hi link MatchParen	Search
hi link IncSearch	Search

"                               Generic Language
" =============================================================================
hi String		guifg=#d69d85
hi Type			guifg=#569cd6 gui=none
hi Number		guifg=#b5cea8
hi Constant		guifg=#ff7ab2
hi Comment		guifg=#57a64a
hi Define		guifg=#ffa14f
hi Identifier		guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi link Include		Default
hi link PreProc		Define
hi link StorageClass	Type
hi link Boolean 	Type
hi link float 		Number
hi link Statement 	Type
hi link Operator 	Default

"                                    C#
" =============================================================================
hi csExcludedCode	guifg=#7f8c98
hi csEnumMemberName	guifg=#9cdcfe
hi csClass		guifg=#8ad1c3
hi csInterface		guifg=#b8d7a3
hi csTypeParamName	guifg=#baf28f
hi csPreCondit		guifg=#9b9b9b
hi link csEnum		csInterface
hi link csString	String
hi link csKeyword	Type
hi link csComment	Comment
hi link csNumber	Number
hi link csPreprocessor	Define
hi link csDelegateName	csClass
hi link csStruct	csClass

"                                 Vim-Quickfix
" =============================================================================
hi qfFileName		guifg=#8ad1c3
hi qfLineNr		guifg=#555555
hi qfSeparator		guifg=#555555
hi qfMsbuildCsError	guifg=#ff5b5e
hi qfMsbuildCsWarning	guifg=#feff5b

"                                 Vim-Help
" =============================================================================
hi link helpHyperTextEntry	Number
hi link helpSectionDelim	PreProc
hi link helpHeadline		csInterface
hi link helpHeader		csClass

"                                  Python
" =============================================================================
hi link pythonInclude		Type
hi link pythonException		Type
hi link pythonExceptions	csClass
hi link pythonStatement		Type
hi link pythonBuiltin		Type
hi link pythonConditional	Type
hi link pythonRepeat		Type

"                                    XML
" =============================================================================
hi xmlTag	        guifg=#b4b4b4
hi xmlTagName    	guifg=#679ad1
hi xmlAttribPunct 	guifg=#dcdcdc
hi xmlAttrib		guifg=#9ec8f0
hi xmlString 		guifg=#c8c8c8
hi link xmlProcessingDelim xmlTag
hi link xmlEndTag xmlTagName
hi link xmlNamespace xmlAttrib
hi link xmlTag xmlTagName

"                                 Vim Script
" =============================================================================
hi vimFuncName          guifg=#dcdcaa
hi vimOption            guifg=#c586c0
hi vimVar               guifg=#9cdcfe
hi link vimcommand Type
hi link vimIsCommand Type
hi link vimSetSep Default
hi link vimHiGroup csClass

"                                 Swift
" =============================================================================
hi swiftImport             guifg=#ff7ab2
hi swiftTypeDefinition     guifg=#ff7ab2
hi swiftDefinitionModifier guifg=#ff7ab2
hi swiftFuncDefinition     guifg=#ff7ab2
hi swiftKeyword            guifg=#ff7ab2
hi swiftVarDefinition      guifg=#ff7ab2
hi swiftTypePair           guifg=#baf28f
hi swiftTypeName           guifg=#baf28f
hi swiftPreproc            guifg=#ffa14f
hi swiftComment            guifg=#7f8c98 guibg=NONE gui=italic
hi swiftString             guifg=#ff8170 guibg=NONE gui=italic
hi swiftDecimal            guifg=#a79df7 guibg=NONE gui=italic
hi link swiftType Default
hi link swiftLineComment swiftComment

"                              Shell-Script
" =============================================================================
hi shDerefSimple           guifg=#a0d975 guibg=NONE
hi link shVariable shDerefSimple
hi link shStatement Constant
hi link shSet Constant
hi link shRepeat Constant
hi link shCondition Constant
hi link shConditional Constant

"                                  Json
" =============================================================================
hi jsonKeyword             guifg=#d7ba7d

"                                  Rust
" =============================================================================
hi rustKeyword             guifg=#ab8ac1
hi rustString              guifg=#83a300
hi rustEnum                guifg=#769acb
hi rustCommentLineDoc      guifg=#8d8d8b
hi rustEnumVariant         guifg=#ee6868
hi rustMacro               guifg=#3e999f
hi rustLifetime            guifg=#d97f26
hi link rustQuestionMark rustLifetime
hi link rustEscape rustLifetime
hi link rustCharacter rustString
hi link rustTypedef rustKeyword
hi link rustType Default
hi link rustTrait Default
hi link rustConditional rustKeyword
hi link rustRepeat rustKeyword
hi link rustSelf rustEnumVariant
hi link rustBoolean rustEnumVariant
hi link rustStructure rustKeyword
hi link rustDerive rustEnumVariant
hi link rustDeriveTrait rustEnumVariant
hi link rustAttribute rustEnumVariant
hi link rustSigil rustKeyword
hi link rustAssert rustMacro
hi link rustStringDelimiter rustString
hi link rustStorage rustKeyword
hi link rustModPath Default
hi link rustModPathSep rustModPath
hi link rustPanic Define
hi link rustUnsafeKeyword Type

"                                  Markdown
" =============================================================================
hi link markdownH1		rustLifetime
hi link markdownH2		rustLifetime
hi link markdownH3		rustLifetime
hi link markdownH4		rustLifetime
hi link markdownH5		rustLifetime
hi link markdownH6		rustLifetime
hi link markdownH1Delimiter	rustLifetime
hi link markdownH2Delimiter	rustLifetime
hi link markdownH3Delimiter	rustLifetime
hi link markdownH4Delimiter	rustLifetime
hi link markdownH5Delimiter	rustLifetime
hi link markdownH6Delimiter	rustLifetime

"                                    C
" =============================================================================
hi cDefine		guifg=#9b9b9b
hi cIncluded 		guifg=#d69d85
hi cType 		guifg=#569cd6
hi cConditional 	guifg=#d8a0df
hi cTodo		guifg=#47ff6a
hi link cStatement 	cConditional
hi link cStorageClass 	cType
hi link cPreCondit	cDefine
hi link cInclude 	cDefine
hi link cString 	String
hi link cStructure 	cType
hi link cConstant 	Number
hi link cUserLabel 	csEnumMemberName
hi link cRepeat 	cConditional
hi link cNumber 	cConstant
hi link cLabel 		cDefine
hi link cTypedef	cType

"                                    C++
" =============================================================================
hi link cppStatement 	cType
hi link cppModifier	cType
hi link cppType 	cType
hi link cppStructure	cType
hi link cppBoolean	cType
hi link cppConstant	cType
hi link cppExceptions	cType

"                                    QT
" =============================================================================
hi qtMacro		guifg=#beb7ff

"                                NERDTree
" =============================================================================
hi NERDTreeDir           guifg=#cbecfe
hi link NERDTreeExecFile csClass
hi link NERDTreeClosable Number
hi link NERDTreeOpenable NERDTreeClosable
hi link NERDTreeHelp     Comment
hi link NERDTreeCWD      csClass
hi link NERDTreeUp       Constant
hi link NERDTreeFlags    Default

"                                  ALE
" =============================================================================
hi ALEInfoSign                guifg=#9cdcfe
hi ALEWarningSign             guifg=#fffb04
hi ALEErrorSign               guifg=#ff5b5e
hi clear ALEWarning
hi clear ALEError

"                                  UltiSnip
" =============================================================================
hi snipSnippetTrigger         guifg=#c586c0
hi snipSnippetTrigger         guifg=#c586c0
hi snipTabStop                guifg=#9cdcfe
hi link snipSnippetHeaderKeyword Type
hi link snipSnippetFooterKeyword Type
hi link snipGlobalHeaderKeyword Type
hi link snipGlobalFooterKeyword Type
hi link snipMirror csClass
hi link snipTabStopDefault Default

"                                  toml
" =============================================================================
hi link tomlTable csClass
hi link tomlTableArray csClass
hi link tomlKey csEnumMemberName

"                                 qml
" =============================================================================
hi link qmlBindingProperty csEnumMemberName
hi link qmlObjectLiteralType csClass
hi link qmlConditional Type
hi link qmlStatement Type
hi link qmlNull Type
hi link qmlReserved Define

"                                 LaTex
" =============================================================================
hi link texInputFile csEnumMemberName
hi link texStatement csClass
hi link texBeginEnd csClass
hi link texNewCmd csClass
hi link texSection csClass
hi link texCmdName csClass
hi link texBeginEndName Normal

"                                 Plugins
" =============================================================================
hi WordUnderTheCursor   guifg=NONE    guibg=#353a3f
hi ExtraWhitespace      guifg=NONE    guibg=#ff5b5e

"                                 cMake
" =============================================================================
hi link cmakeCommandConditional rustKeyword
hi link cmakeCommand rustMacro
hi link cmakeString rustString

"                                  Git
" =============================================================================
hi diffRemoved		guifg=#ed1515	guibg=NONE
hi diffAdded		guifg=#11d116	guibg=NONE
hi diffLine		guifg=#1abc9c	guibg=NONE
hi link diffFile	Default
hi link diffIndexLine	Default
hi link diffSubname	Default

"                                  Echo
" =============================================================================
hi EchoError		guifg=#ed1515	guibg=NONE
hi EchoSuccess		guifg=#11d116	guibg=NONE
