set background=dark
hi! clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mine"

" Core-Editor
" ===========
hi! Default          guifg=#ffffff  guibg=none
hi! Search           guifg=#000000  guibg=#fffb04
hi! CursorLine       guifg=none     guibg=#131313  gui=none cterm=none term=none
hi! CursorLineNr     guifg=#ffffff  cterm=none     term=none
hi! Pmenu            guifg=none     guibg=#2D2d30
hi! PmenuSel         guifg=none     guibg=#0071cc
hi! Normal           guifg=#ffffff  guibg=#101010
hi! SignColumn       guifg=NONE     guibg=#101010
hi! FoldColumn       guifg=#ffffff  guibg=#101010
hi! Folded           guifg=#ffffff  guibg=#3465a4
hi! LineNr           guifg=#555555
hi! Visual           guifg=none     guibg=#264f78
hi! Cursor           guifg=#ffffff  guibg=#ff2a62
hi! VertSplit        guifg=#2e2e2e  guibg=#101010
hi! WinSeparator     guifg=#2e2e2e  guibg=#101010
hi! Note             guifg=none     guibg=#00ff00
hi! StatusLine       guifg=#ffffff  guibg=#333333  gui=bold cterm=bold term=bold
hi! StatusLineNC     guifg=none     guibg=#1F1f1f  gui=none cterm=none term=none
hi! ColorColumn      guifg=none     guibg=#333333
hi! NonText          guifg=#404040  guibg=none
hi! SpecialKey       guifg=#7f8c98
hi! Special          guifg=#F9A50A
hi! iCursor          guifg=#ffffff  guibg=#11d116
hi! nCursor          guifg=#ffffff  guibg=#ffb846
hi! TODO             guifg=none     guibg=none
hi! TabLineFill      guifg=#34495e  guibg=#34495e
hi! TabLine          guifg=#ffffff  guibg=#34495e  gui=none cterm=none
hi! TabLineSel       guifg=#ffffff  guibg=#587da1  gui=none cterm=none
hi! Title            guifg=#ffffff  guibg=none

hi! DiffAdd          guifg=NONE     guibg=#13370b
hi! DiffDelete       guifg=NONE     guibg=#481010
hi! DiffChange       guifg=NONE     guibg=#222a39
hi! DiffText         guifg=NONE     guibg=#2f3f5c
hi! Function         guifg=#dcdcaa  guibg=none

hi! link MatchParen  Search
hi! link IncSearch   Search

" Programming language
" ====================
hi! String             guifg=#d69d85
hi! Type               guifg=#569cd6 gui=none
hi! Number             guifg=#b5cea8
hi! Constant           guifg=#ff7ab2
hi! Comment            guifg=#57a64a
hi! Define             guifg=#d97f26
hi! Identifier         guifg=none    guibg=none ctermfg=none ctermbg=none cterm=none
hi! PreProc            guifg=#d97f26
hi! link Include                 Default
hi! link StorageClass            Type
hi! link Boolean                 Type
hi! link float                   Number
hi! link Statement               Type
hi! link Operator                Default
hi! link @repeat                 cConditional
hi! link @include                PreProc
hi! link @conditional            cConditional
hi! link @type.builtin           csClass
hi! link @constant.builtin       Type
hi! link @punctuation.delimiter  Normal
hi! link @punctuation.bracket    Normal


" Vim-Script (.vim)
" =================
hi! vimFuncName          guifg=#dcdcaa
hi! vimOption            guifg=#c586c0
hi! vimVar               guifg=#9cdcfe
hi! vimHiKeyList         guifg=#9cdcfe
hi! vimHiGuiRgb          guifg=#d8a0df
hi! vimHiAttrib          guifg=#d69d85
hi! vimHiGroup           guifg=#b8d7a3

hi! link vimFgBgAttrib   vimHiAttrib
hi! link vimHiGuiFgBg    vimHiKeyList
hi! link vimHiCtermFgBg  vimHiKeyList
hi! link vimHiGui        vimHiKeyList
hi! link vimHiTerm       vimHiKeyList
hi! link vimHiCterm      vimHiKeyList
hi! link vimGroup        vimHiGroup
hi! link vimcommand      Type
hi! link vimIsCommand    Type
hi! link vimSetSep       Default

" Vim-Help (vim-doc)
" ==================
hi! helpURL                  guifg=#909090
hi! link helpHyperTextEntry  Type
hi! link helpSectionDelim    Comment
hi! link helpHeadline        Comment
hi! link helpHeader          csClass
hi! link helpExample         vimHiGuiRgb
hi! link helpCommand         vimHiGuiRgb

" C# (.cs)
" ========
hi! csExcludedCode       guifg=#7f8c98
hi! csEnumMemberName     guifg=#9cdcfe
hi! csClass              guifg=#8ad1c3
hi! csInterface          guifg=#b8d7a3
hi! csTypeParamName      guifg=#baf28f
hi! csPreCondit          guifg=#9b9b9b
hi! link csEnum                        csInterface
hi! link csString                      String
hi! link csKeyword                     Type
hi! link csComment                     Comment
hi! link csNumber                      Number
hi! link csPreprocessor                Define
hi! link csDelegateName                csClass
hi! link csStruct                      csClass
hi! link @include.c_sharp              Type
hi! link @type.c_sharp                 csClass
hi! link @type.builtin.c_sharp         Type
hi! link @lsp.typemod.class.static.cs  csClass
hi! link @lsp.type.class.cs            csClass
hi! link @lsp.type.namespace.cs        Identifier

" Vim-Quickfix
" ============
hi! qfFileName          guifg=#41ad5e
hi! qfLineNr            guifg=#9cdcfe
hi! qfSeparator         guifg=#9cdcfe
hi! qfMsbuildCsError    guifg=#ff5b5e
hi! qfMsbuildCsWarning  guifg=#feff5b

" Python (.py)
" ============
hi! link pythonInclude              cDefine
hi! link pythonException            Type
hi! link pythonExceptions           csClass
hi! link pythonStatement            Type
hi! link pythonBuiltin              Type
hi! link pythonConditional          cConditional
hi! link pythonRepeat               Type
hi! link pythonOperator             Type
hi! link @exception                 Type
hi! link @keyword                   Type
hi! link @type.python               csClass
hi! link @variable.builtin.python   Type
hi! link @constructor.python        csClass
hi! link @constructor.python        csClass
hi! link @keyword.import.python     PreProc
hi! link @keyword.directive.python  PreProc

" XML (.xml)
" ==========
hi! xmlTag                   guifg=#b4b4b4
hi! xmlTagName               guifg=#679ad1
hi! xmlAttribPunct           guifg=#dcdcdc
hi! xmlAttrib                guifg=#9ec8f0
hi! xmlString                guifg=#c8c8c8
hi! link xmlProcessingDelim  xmlTag
hi! link xmlEndTag           xmlTagName
hi! link xmlNamespace        xmlAttrib
hi! link xmlTag              xmlTagName
hi! link @tag.xml            yamlField
hi! link @string.xml         yamlString
hi! link @constant.xml       PreProc
hi! link @tag.attribute.xml  yamlInteger
hi! link @tag.delimiter.xml  yamlField

" Swift (.swift)
" ==============
hi! swiftImport              guifg=#ff7ab2
hi! swiftTypeDefinition      guifg=#ff7ab2
hi! swiftDefinitionModifier  guifg=#ff7ab2
hi! swiftFuncDefinition      guifg=#ff7ab2
hi! swiftKeyword             guifg=#ff7ab2
hi! swiftVarDefinition       guifg=#ff7ab2
hi! swiftTypePair            guifg=#baf28f
hi! swiftTypeName            guifg=#baf28f
hi! swiftPreproc             guifg=#ffa14f
hi! swiftComment             guifg=#7f8c98 guibg=none gui=italic
hi! swiftString              guifg=#ff8170 guibg=none gui=italic
hi! swiftDecimal             guifg=#a79df7 guibg=none gui=italic
hi! link swiftType           Default
hi! link swiftLineComment    swiftComment

" C (.c, .h)
" ==========
hi! cDefine               guifg=#9b9b9b
hi! cType                 guifg=#569cd6
hi! cConditional          guifg=#d8a0df
hi! cTodo                 guifg=#47ff6a
hi! cIncluded             guifg=#999999
hi! link cPreProc             PreProc
hi! link cPreCondit           PreProc
hi! link cInclude             PreProc
hi! link cStatement           cConditional
hi! link cStorageClass        cType
hi! link cString              String
hi! link cStructure           cType
hi! link cConstant            Number
hi! link cUserLabel           csEnumMemberName
hi! link cRepeat              cConditional
hi! link cNumber              cConstant
hi! link cLabel               cDefine
hi! link cTypedef             cType
hi! link @type.c              csClass
hi! link @type.builtin.c      Type
hi! link @label.c             cConditional
hi! link @constant.c          PreProc
hi! link @character.c         String
hi! link @keyword.operator.c  Type

" Rust (.rs)
" ==========
hi! rustUnsafeKeyword               guifg=#eb5e5e
hi! link rustKeyword                Type
hi! link rustTypeDef                Type
hi! link rustConditional            cConditional
hi! link rustRepeat                 cConditional
hi! link rustSelf                   Type
hi! link rustModPathSep             Normal
hi! link rustStructure              Type
hi! link rustDeriveTrait            csClass
hi! link @lsp.type.namespace.rust   Default
hi! link @lsp.type.interface.rust   csClass
hi! link @lsp.type.struct.rust      csClass
hi! link @lsp.type.enum.rust        csInterface
hi! link @lsp.type.enumMember.rust  csEnumMemberName

" C++ (.cpp, .hpp)
" ================
hi! link cppStatement           cType
hi! link cppModifier            cType
hi! link cppType                cType
hi! link cppStructure           cType
hi! link cppBoolean             cType
hi! link cppConstant            cType
hi! link cppExceptions          cType

hi! link @type.builtin.cpp      Type
hi! link @type.cpp              csClass
hi! link @variable.builtin.cpp  Type
hi! link @keyword.import.cpp    PreProc
hi! link @lsp.type.class.cpp    csClass

" QT
" ==
hi! qtMacro        guifg=#beb7ff

" UltiSnip (.snippet)
" ===================
hi! snipSnippetTrigger             guifg=#c586c0
hi! snipSnippetTrigger             guifg=#c586c0
hi! snipTabStop                    guifg=#9cdcfe
hi! link snipSnippetHeaderKeyword  Type
hi! link snipSnippetFooterKeyword  Type
hi! link snipGlobalHeaderKeyword   Type
hi! link snipGlobalFooterKeyword   Type
hi! link snipMirror                csClass
hi! link snipTabStopDefault        Default

" TOML (.toml)
" ============
hi! link tomlTable                  csClass
hi! link tomlTableArray             csClass
hi! link tomlKey                    csEnumMemberName
hi! link tomlDotInKey               Default
hi! link @property.toml             csEnumMemberName
hi! link @punctuation.bracket.toml  PreProc

" QML (.qml)
" ==========
hi! link qmlBindingProperty    csEnumMemberName
hi! link qmlObjectLiteralType  csClass
hi! link qmlConditional        Type
hi! link qmlStatement          Type
hi! link qmlNull               Type
hi! link qmlReserved           Define

" LaTex (.tex)
" ============
hi! link texInputFile     csEnumMemberName
hi! link texStatement     csClass
hi! link texBeginEnd      csClass
hi! link texNewCmd        csClass
hi! link texSection       csClass
hi! link texCmdName       csClass
hi! link texBeginEndName  Normal

" Local plugins
" =============
hi! WordUnderTheCursor  guifg=none  guibg=#353a3f
hi! ExtraWhitespace     guifg=none  guibg=#ff5b5e

" cMake (CMakeLists.txt)
" ======================
hi! link cmakeCommandConditional  cConditional
hi! link cmakeCommand             PreProc
hi! link cmakeString              String
hi! link cmakeCommandRepeat       cConditional
hi! link @variable.cmake          PreProc

" Git
" ===
hi! diffRemoved                  guifg=#ed1515       guibg=none
hi! diffAdded                    guifg=#11d116       guibg=none
hi! diffLine                     guifg=#1abc9c       guibg=none

hi! gitconfigSection             guifg=#fc5e56
hi! gitcommitFirstLine           guifg=#fc6f65
hi! gitcommitSelectedFile        guifg=#11d116
hi! link gitcommitSelectedType   Comment
hi! link gitcommitBranch         Comment
hi! link gitcommitHeader         Comment
hi! link gitcommitUntrackedFile  cDefine
hi! link gitcommitSummary        gitcommitFirstLine
hi! link diffFile                Default
hi! link diffIndexLine           Default
hi! link diffSubname             Default

" Git Fugitive
" ============
hi! link FugitiveblameTime        Default
hi! link FugitiveblameAnnotation  Default
hi! link FugitiveblameDelimiter   Default

" LSP diagnostics
" ===============
hi! DiagnosticError  guifg=#ff5b5e
hi! DiagnosticWarn   guifg=#fffb04
hi! DiagnosticInfo   guifg=#9cdcfe
hi! DiagnosticHint   guifg=#9cdcfe

" Shell-Script (.sh)
" ==================
hi! link shVariable     shDerefSimple
hi! link shStatement    cType
hi! link shSet          Constant
hi! link shRepeat       Constant
hi! link shCondition    Constant
hi! link shConditional  cConditional
hi! link shDerefSimple  csClass
hi! link shDerefVar     csClass
hi! link shVariable     csClass


" Markdown (.md)
" ==============
hi! markdownH1                      guifg=#6ea9d5
hi! markdownH2                      guifg=#a8df8e
hi! markdownH3                      guifg=#f78ca2
hi! markdownH4                      guifg=#d2d2d2
hi! markdownH5                      guifg=#d2d2d2
hi! markdownH6                      guifg=#d2d2d2
hi! markdownH1Delimiter             guifg=#707070
hi! markdownCodeBlock               guifg=#a0a0a0
hi! link markdownOrderedListMarker   Define
hi! link markdownListMarker          Define
hi! link markdownH2Delimiter         markdownH1Delimiter
hi! link markdownH3Delimiter         markdownH1Delimiter
hi! link markdownH4Delimiter         markdownH1Delimiter
hi! link markdownH5Delimiter         markdownH1Delimiter
hi! link markdownH6Delimiter         markdownH1Delimiter
hi! link markdownCode                markdownCodeBlock
hi! link @markup.heading.1.markdown  markdownH1
hi! link @markup.heading.2.markdown  markdownH2
hi! link @markup.heading.3.markdown  markdownH3
hi! link @markup.heading.4.markdown  markdownH4
hi! link @markup.heading.5.markdown  markdownH5
hi! link @markup.list.markdown       rustUnsafeKeyword
hi! link @punctuation.special.md     PreProc
hi! link @text.literal.md            markdownCodeBlock
hi! link @text.title.md              Comment

" reStructuredText (.rst)
" =======================
hi! rstDirective             guifg=#d97f26
hi! link rstSections            markdownH1
hi! link rstLiteralBlock        markdownCodeBlock
hi! link rstHyperlinkTarget     Type
hi! link rstInLineLiteral       markdownCodeBlock
hi! link @markup.raw.rst        markdownCodeBlock
hi! link @markup.raw.block.rst  markdownCodeBlock
hi! link @text.title.rst        csEnum
hi! link @constant.rst          Special
hi! link @markup.list.rst       csEnumMemberName
hi! link @markup.heading.rst    csEnum
hi! link @markup.link.rst       Type
hi! link @function.rst          rustUnsafeKeyword

" Dockerfile (docker)
" ===================
hi! link dockerfileKeyword    Type

" Groovy (.groovy)
" ================
hi! groovyELExpr            guifg=#d97f26
hi! groovyParenT            guifg=#11d116
hi! groovyExternal          guifg=#A0A0A0
hi! groovyUserLabel         guifg=#9cdcfe
hi! link groovyStatement    Type
hi! link groovyConditional  cConditional

" Debian (control)
" ================
hi! link debcontrolKey    Define

" ZSH (.zsh)
" ==========
hi! link zshCommands  Type
hi! link zshOptStart  Type
hi! link zshDeref     diffAdded
hi! link zshOption    cPreProc

" YAML (.yml/.yaml)
" =================
hi! yamlComment          guifg=#969696
hi! yamlBlockMappingKey  guifg=#88a8c1
hi! yamlPlainScalar      guifg=#b5bd68
hi! yamlBool             guifg=#b294bb
hi! yamlInteger          guifg=#de945f
hi! yamlField            guifg=#81a2be
hi! yamlString           guifg=#b5bd68
hi! link yamlAnchor               Normal
hi! link yamlKeyValueDelimiter    Normal
hi! link yamlFlowString           yamlPlainScalar
hi! link yamlFlowStringDelimiter  yamlPlainScalar
hi! link @property.yaml           yamlField
hi! link @field.yaml              yamlField
hi! link @string.yaml             yamlString
hi! link @number.yaml             yamlInteger
hi! link @comment.yaml            yamlComment
hi! link @boolean.yaml            yamlBool
hi! link @label.yaml              rustUnsafeKeyword

" LUA (.lua)
" ==========
hi! link luaStatement        Type
hi! link luaTable        Default
hi! link luaCond            cConditional
hi! link luaCondElse        cConditional
hi! link luaConstant        Number

" nvim-cmp
" ========
hi! CmpItemAbbrDeprecated       guibg=NONE           gui=strikethrough  guifg=#808080
hi! CmpItemAbbrMatch            guibg=NONE           guifg=#569CD6
hi! CmpItemKindVariable         guibg=NONE           guifg=#9CDCFE
hi! CmpItemKindFunction         guibg=NONE           guifg=#C586C0
hi! CmpItemKindKeyword          guibg=NONE           guifg=#D4D4D4
hi! CmpGhostText                guibg=NONE           guifg=#808080
hi! link CmpItemAbbrMatchFuzzy  CmpItemAbbrMatch
hi! link CmpItemKindInterface   CmpItemKindVariable
hi! link CmpItemKindText        CmpItemKindVariable
hi! link CmpItemKindMethod      CmpItemKindFunction
hi! link CmpItemKindProperty    CmpItemKindKeyword
hi! link CmpItemKindUnit        CmpItemKindKeyword

" Kconfig (Kconfig)
" =================
hi! kconfigKeyword           guifg=#FF5F5F
hi! link kconfigConditional  cConditional
hi! link kconfigHelpText     Comment

" Devicetree (dts/dtsi)
" =====================
hi! link @constant.devicetree        PreProc
hi! link @namespace.devicetree        PreProc
hi! link @property.devicetree        vimHiKeyList
hi! link @label.devicetree        PreProc

" json (json/json5)
" =================
hi! link jsonBraces      Normal
hi! link json5Braces     Normal
hi! link jsonDelimiter   Normal
hi! link json5Delimiter  Normal
hi! link json5Key        jsonKeyword
hi! link jsonKeyword     vimHiKeyList
hi! link @property.json  yamlField
hi! link @string.json    yamlString
hi! link @number.json    yamlInteger
hi! link @boolean.json   yamlBool
hi! link @label.json     yamlField
hi! link @keyword.json5  yamlField
hi! link @string.json5   yamlString
hi! link @number.json5   yamlInteger
hi! link @boolean.json5  yamlBool

" Mail
" ====
hi! mailQuoted1        guifg=#2ECC71
hi! mailQuoted2        guifg=#3498DB
hi! mailQutoed3        guifg=#9B59B6

" Neotree
" =======
hi! NeoTreeDirectoryName        guifg=#99ca2a
hi! NeoTreeDirectoryIcon        guifg=#41a2f1
hi! NeoTreeFileIcon             guifg=#d294e2
hi! link NeoTreeFileStatsHeader NeoTreeFileStats
hi! link NeoTreeRootName        Default

