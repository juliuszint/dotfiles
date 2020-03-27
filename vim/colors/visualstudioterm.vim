" This scheme was created by CSApproxSnapshot
" on Sun, 23 Dec 2018

hi clear
if exists("syntax_on")
    syntax reset
endif

if v:version < 700
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" substitute(substitute(<q-args>, "undercurl", "underline", "g"), "guisp\\S\\+", "", "g")
else
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" <q-args>
endif

function! s:old_kde()
  " Konsole only used its own palette up til KDE 4.2.0
  if executable('kde4-config') && system('kde4-config --kde-version') =~ '^4.[10].'
    return 1
  elseif executable('kde-config') && system('kde-config --version') =~# 'KDE: 3.'
    return 1
  else
    return 0
  endif
endfunction

if 0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_konsole") && g:CSApprox_konsole) || (&term =~? "^konsole" && s:old_kde())
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=253 gui=NONE guibg=#1e1e1e guifg=#dcdcdc
    CSAHi jsonKeyword term=NONE cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#d7ba7d
    CSAHi xmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=253 gui=NONE guibg=bg guifg=#dadada
    CSAHi xmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#add8e6
    CSAHi xmlAttribPunct term=NONE cterm=NONE ctermbg=bg ctermfg=253 gui=NONE guibg=bg guifg=#dcdcdc
    CSAHi cType term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi csPreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#9b9b9b
    CSAHi htmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#808080
    CSAHi htmlArg term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#9cdcfe
    CSAHi htmlCommentError term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi ToolbarLine term=underline cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#7f7f7f guifg=fg
    CSAHi ToolbarButton term=NONE cterm=bold ctermbg=252 ctermfg=16 gui=bold guibg=#d3d3d3 guifg=#000000
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=107 gui=NONE guibg=bg guifg=#57a64a
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#569cd6
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=#ffff60
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ff80ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#569cd6
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=30 ctermfg=fg gui=NONE guibg=#015f60 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi nunitSectionHeader term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#34e2e2
    CSAHi nunitTestFailed term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff5b5e
    CSAHi nunitTestIgnored term=NONE cterm=NONE ctermbg=bg ctermfg=228 gui=NONE guibg=bg guifg=#f4ff5b
    CSAHi cTagsMember term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#dda0dd
    CSAHi cTagsEnumerationValue term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#b8d7a3
    CSAHi Default term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff5b5e
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=#8ae234
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=#5e5e5e guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=32 ctermfg=fg gui=NONE guibg=#0071cc guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=#bebebe guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi xmlAttrib term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ee82ee
    CSAHi slideSeperator term=NONE cterm=NONE ctermbg=236 ctermfg=96 gui=NONE guibg=#2d2d30 guifg=#672179
    CSAHi diffLine term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#06989a
    CSAHi nunitSectionAttribute term=NONE cterm=NONE ctermbg=bg ctermfg=121 gui=NONE guibg=bg guifg=#5bff80
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1e1e1e
    CSAHi Error term=reverse cterm=bold,underline ctermbg=196 ctermfg=fg gui=bold,underline guibg=#ff0000 guifg=fg
    CSAHi Todo term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=181 gui=NONE guibg=bg guifg=#d69d85
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#b5cea8
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#2b91af
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=73 gui=bold guibg=bg guifg=#2b91af
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi StatusLine term=bold,reverse cterm=bold ctermbg=32 ctermfg=231 gui=bold guibg=#0071cc guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=236 ctermfg=fg gui=bold guibg=#2d2d30 guifg=fg
    CSAHi VertSplit term=reverse cterm=reverse ctermbg=96 ctermfg=96 gui=reverse guibg=#68217a guifg=#68217a
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=66 ctermfg=fg gui=NONE guibg=#264f78 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi MyTagListTagName term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Note term=NONE cterm=NONE ctermbg=46 ctermfg=fg gui=NONE guibg=#00ff00 guifg=fg
    CSAHi WordUnderTheCursor term=NONE cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#014343 guifg=fg
    CSAHi cFormat term=NONE cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#80ff80
    CSAHi cTagsNamespace term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#add8e6
    CSAHi cStructure term=NONE cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#569cd6
    CSAHi cTagsDefinedName term=NONE cterm=NONE ctermbg=bg ctermfg=176 gui=NONE guibg=bg guifg=#bd63c5
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#020202 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#2d2d30 guifg=fg
    CSAHi StatusLineTerm term=bold,reverse cterm=bold ctermbg=157 ctermfg=234 gui=bold guibg=#90ee90 guifg=#1e1e1e
    CSAHi StatusLineTermNC term=reverse cterm=NONE ctermbg=157 ctermfg=234 gui=NONE guibg=#90ee90 guifg=#1e1e1e
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=fg gui=NONE guibg=#00ff00 guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=253 ctermfg=234 gui=NONE guibg=#dcdcdc guifg=#1e1e1e
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#008b8b guifg=fg
    CSAHi NERDTreeDir term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#a6ca54
    CSAHi cTagsClass term=NONE cterm=NONE ctermbg=bg ctermfg=115 gui=NONE guibg=bg guifg=#4ec9b0
    CSAHi NERDTreeCsharpDesignerFile term=NONE cterm=NONE ctermbg=bg ctermfg=243 gui=NONE guibg=bg guifg=#7a7a7a
    CSAHi NERDTreeCsharpSolutionFile term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#cab4fa
    CSAHi NERDTreeCsharpProjectFile term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#8fc1ff
    CSAHi qfFileName term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#cab4fa
    CSAHi qfCsError term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff5b5e
    CSAHi qfCsWarning term=NONE cterm=NONE ctermbg=bg ctermfg=228 gui=NONE guibg=bg guifg=#feff5b
    CSAHi ExtraWhitespace term=NONE cterm=NONE ctermbg=210 ctermfg=fg gui=NONE guibg=#ff5b5e guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi MyTagListFileName term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#9b9b9b
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi DiffAdd term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi DiffChange term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=253 gui=NONE guibg=#1e1e1e guifg=#dcdcdc
    CSAHi jsonKeyword term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#d7ba7d
    CSAHi xmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=253 gui=NONE guibg=bg guifg=#dadada
    CSAHi xmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#add8e6
    CSAHi xmlAttribPunct term=NONE cterm=NONE ctermbg=bg ctermfg=253 gui=NONE guibg=bg guifg=#dcdcdc
    CSAHi cType term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi csPreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=247 gui=NONE guibg=bg guifg=#9b9b9b
    CSAHi htmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#808080
    CSAHi htmlArg term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#9cdcfe
    CSAHi htmlCommentError term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi ToolbarLine term=underline cterm=NONE ctermbg=145 ctermfg=fg gui=NONE guibg=#7f7f7f guifg=fg
    CSAHi ToolbarButton term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=#d3d3d3 guifg=#000000
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=114 gui=NONE guibg=bg guifg=#57a64a
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#569cd6
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=#ffff60
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ff80ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#569cd6
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=30 ctermfg=fg gui=NONE guibg=#015f60 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi nunitSectionHeader term=NONE cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#34e2e2
    CSAHi nunitTestFailed term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff5b5e
    CSAHi nunitTestIgnored term=NONE cterm=NONE ctermbg=bg ctermfg=228 gui=NONE guibg=bg guifg=#f4ff5b
    CSAHi cTagsMember term=NONE cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#dda0dd
    CSAHi cTagsEnumerationValue term=NONE cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=#b8d7a3
    CSAHi Default term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff5b5e
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=bg ctermfg=155 gui=NONE guibg=bg guifg=#8ae234
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=#5e5e5e guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=39 ctermfg=fg gui=NONE guibg=#0071cc guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=#bebebe guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi xmlAttrib term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ee82ee
    CSAHi slideSeperator term=NONE cterm=NONE ctermbg=59 ctermfg=97 gui=NONE guibg=#2d2d30 guifg=#672179
    CSAHi diffLine term=NONE cterm=NONE ctermbg=bg ctermfg=44 gui=NONE guibg=bg guifg=#06989a
    CSAHi nunitSectionAttribute term=NONE cterm=NONE ctermbg=bg ctermfg=121 gui=NONE guibg=bg guifg=#5bff80
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1e1e1e
    CSAHi Error term=reverse cterm=bold,underline ctermbg=196 ctermfg=fg gui=bold,underline guibg=#ff0000 guifg=fg
    CSAHi Todo term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#d69d85
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=#b5cea8
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#2b91af
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#2b91af
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi StatusLine term=bold,reverse cterm=bold ctermbg=39 ctermfg=255 gui=bold guibg=#0071cc guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=59 ctermfg=fg gui=bold guibg=#2d2d30 guifg=fg
    CSAHi VertSplit term=reverse cterm=reverse ctermbg=97 ctermfg=97 gui=reverse guibg=#68217a guifg=#68217a
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=67 ctermfg=fg gui=NONE guibg=#264f78 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi MyTagListTagName term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Note term=NONE cterm=NONE ctermbg=46 ctermfg=fg gui=NONE guibg=#00ff00 guifg=fg
    CSAHi WordUnderTheCursor term=NONE cterm=NONE ctermbg=30 ctermfg=fg gui=NONE guibg=#014343 guifg=fg
    CSAHi cFormat term=NONE cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#80ff80
    CSAHi cTagsNamespace term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#add8e6
    CSAHi cStructure term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#569cd6
    CSAHi cTagsDefinedName term=NONE cterm=NONE ctermbg=bg ctermfg=177 gui=NONE guibg=bg guifg=#bd63c5
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#020202 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#2d2d30 guifg=fg
    CSAHi StatusLineTerm term=bold,reverse cterm=bold ctermbg=157 ctermfg=234 gui=bold guibg=#90ee90 guifg=#1e1e1e
    CSAHi StatusLineTermNC term=reverse cterm=NONE ctermbg=157 ctermfg=234 gui=NONE guibg=#90ee90 guifg=#1e1e1e
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=fg gui=NONE guibg=#00ff00 guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=253 ctermfg=234 gui=NONE guibg=#dcdcdc guifg=#1e1e1e
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#008b8b guifg=fg
    CSAHi NERDTreeDir term=NONE cterm=NONE ctermbg=bg ctermfg=192 gui=NONE guibg=bg guifg=#a6ca54
    CSAHi cTagsClass term=NONE cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=#4ec9b0
    CSAHi NERDTreeCsharpDesignerFile term=NONE cterm=NONE ctermbg=bg ctermfg=243 gui=NONE guibg=bg guifg=#7a7a7a
    CSAHi NERDTreeCsharpSolutionFile term=NONE cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#cab4fa
    CSAHi NERDTreeCsharpProjectFile term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#8fc1ff
    CSAHi qfFileName term=NONE cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#cab4fa
    CSAHi qfCsError term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff5b5e
    CSAHi qfCsWarning term=NONE cterm=NONE ctermbg=bg ctermfg=228 gui=NONE guibg=bg guifg=#feff5b
    CSAHi ExtraWhitespace term=NONE cterm=NONE ctermbg=210 ctermfg=fg gui=NONE guibg=#ff5b5e guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi MyTagListFileName term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=247 gui=NONE guibg=bg guifg=#9b9b9b
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi DiffAdd term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi DiffChange term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=231 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=253 gui=NONE guibg=#1e1e1e guifg=#dcdcdc
    CSAHi jsonKeyword term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=#d7ba7d
    CSAHi xmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=253 gui=NONE guibg=bg guifg=#dadada
    CSAHi xmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#add8e6
    CSAHi xmlAttribPunct term=NONE cterm=NONE ctermbg=bg ctermfg=253 gui=NONE guibg=bg guifg=#dcdcdc
    CSAHi cType term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi csPreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=247 gui=NONE guibg=bg guifg=#9b9b9b
    CSAHi htmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#808080
    CSAHi htmlArg term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#9cdcfe
    CSAHi htmlCommentError term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi ToolbarLine term=underline cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#7f7f7f guifg=fg
    CSAHi ToolbarButton term=NONE cterm=bold ctermbg=252 ctermfg=16 gui=bold guibg=#d3d3d3 guifg=#000000
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#57a64a
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#569cd6
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=227 gui=bold guibg=bg guifg=#ffff60
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=213 gui=NONE guibg=bg guifg=#ff80ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#569cd6
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#015f60 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi nunitSectionHeader term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#34e2e2
    CSAHi nunitTestFailed term=NONE cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=#ff5b5e
    CSAHi nunitTestIgnored term=NONE cterm=NONE ctermbg=bg ctermfg=227 gui=NONE guibg=bg guifg=#f4ff5b
    CSAHi cTagsMember term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#dda0dd
    CSAHi cTagsEnumerationValue term=NONE cterm=NONE ctermbg=bg ctermfg=151 gui=NONE guibg=bg guifg=#b8d7a3
    CSAHi Default term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=#ff5b5e
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=#8ae234
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#5e5e5e guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=26 ctermfg=fg gui=NONE guibg=#0071cc guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=#bebebe guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi xmlAttrib term=NONE cterm=NONE ctermbg=bg ctermfg=213 gui=NONE guibg=bg guifg=#ee82ee
    CSAHi slideSeperator term=NONE cterm=NONE ctermbg=236 ctermfg=54 gui=NONE guibg=#2d2d30 guifg=#672179
    CSAHi diffLine term=NONE cterm=NONE ctermbg=bg ctermfg=30 gui=NONE guibg=bg guifg=#06989a
    CSAHi nunitSectionAttribute term=NONE cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=#5bff80
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1e1e1e
    CSAHi Error term=reverse cterm=bold,underline ctermbg=196 ctermfg=fg gui=bold,underline guibg=#ff0000 guifg=fg
    CSAHi Todo term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=#d69d85
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=151 gui=NONE guibg=bg guifg=#b5cea8
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#2b91af
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=31 gui=bold guibg=bg guifg=#2b91af
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi StatusLine term=bold,reverse cterm=bold ctermbg=26 ctermfg=231 gui=bold guibg=#0071cc guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=236 ctermfg=fg gui=bold guibg=#2d2d30 guifg=fg
    CSAHi VertSplit term=reverse cterm=reverse ctermbg=54 ctermfg=54 gui=reverse guibg=#68217a guifg=#68217a
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=24 ctermfg=fg gui=NONE guibg=#264f78 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi MyTagListTagName term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Note term=NONE cterm=NONE ctermbg=46 ctermfg=fg gui=NONE guibg=#00ff00 guifg=fg
    CSAHi WordUnderTheCursor term=NONE cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#014343 guifg=fg
    CSAHi cFormat term=NONE cterm=NONE ctermbg=bg ctermfg=120 gui=NONE guibg=bg guifg=#80ff80
    CSAHi cTagsNamespace term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#add8e6
    CSAHi cStructure term=NONE cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#569cd6
    CSAHi cTagsDefinedName term=NONE cterm=NONE ctermbg=bg ctermfg=134 gui=NONE guibg=bg guifg=#bd63c5
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#020202 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#2d2d30 guifg=fg
    CSAHi StatusLineTerm term=bold,reverse cterm=bold ctermbg=120 ctermfg=234 gui=bold guibg=#90ee90 guifg=#1e1e1e
    CSAHi StatusLineTermNC term=reverse cterm=NONE ctermbg=120 ctermfg=234 gui=NONE guibg=#90ee90 guifg=#1e1e1e
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=fg gui=NONE guibg=#00ff00 guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=253 ctermfg=234 gui=NONE guibg=#dcdcdc guifg=#1e1e1e
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=30 ctermfg=fg gui=NONE guibg=#008b8b guifg=fg
    CSAHi NERDTreeDir term=NONE cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=#a6ca54
    CSAHi cTagsClass term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#4ec9b0
    CSAHi NERDTreeCsharpDesignerFile term=NONE cterm=NONE ctermbg=bg ctermfg=243 gui=NONE guibg=bg guifg=#7a7a7a
    CSAHi NERDTreeCsharpSolutionFile term=NONE cterm=NONE ctermbg=bg ctermfg=183 gui=NONE guibg=bg guifg=#cab4fa
    CSAHi NERDTreeCsharpProjectFile term=NONE cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#8fc1ff
    CSAHi qfFileName term=NONE cterm=NONE ctermbg=bg ctermfg=183 gui=NONE guibg=bg guifg=#cab4fa
    CSAHi qfCsError term=NONE cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=#ff5b5e
    CSAHi qfCsWarning term=NONE cterm=NONE ctermbg=bg ctermfg=227 gui=NONE guibg=bg guifg=#feff5b
    CSAHi ExtraWhitespace term=NONE cterm=NONE ctermbg=203 ctermfg=fg gui=NONE guibg=#ff5b5e guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi MyTagListFileName term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=247 gui=NONE guibg=bg guifg=#9b9b9b
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi DiffAdd term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi DiffChange term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=87 gui=NONE guibg=#1e1e1e guifg=#dcdcdc
    CSAHi jsonKeyword term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#d7ba7d
    CSAHi xmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=86 gui=NONE guibg=bg guifg=#dadada
    CSAHi xmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#add8e6
    CSAHi xmlAttribPunct term=NONE cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#dcdcdc
    CSAHi cType term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi csPreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=#9b9b9b
    CSAHi htmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#808080
    CSAHi htmlArg term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#9cdcfe
    CSAHi htmlCommentError term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi ToolbarLine term=underline cterm=NONE ctermbg=82 ctermfg=fg gui=NONE guibg=#7f7f7f guifg=fg
    CSAHi ToolbarButton term=NONE cterm=bold ctermbg=86 ctermfg=16 gui=bold guibg=#d3d3d3 guifg=#000000
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#57a64a
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#569cd6
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=77 gui=bold guibg=bg guifg=#ffff60
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#ff80ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#569cd6
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=21 ctermfg=fg gui=NONE guibg=#015f60 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi nunitSectionHeader term=NONE cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#34e2e2
    CSAHi nunitTestFailed term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ff5b5e
    CSAHi nunitTestIgnored term=NONE cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#f4ff5b
    CSAHi cTagsMember term=NONE cterm=NONE ctermbg=bg ctermfg=54 gui=NONE guibg=bg guifg=#dda0dd
    CSAHi cTagsEnumerationValue term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#b8d7a3
    CSAHi Default term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ff5b5e
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=#8ae234
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=31 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=81 ctermfg=fg gui=NONE guibg=#5e5e5e guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=22 ctermfg=fg gui=NONE guibg=#0071cc guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=#bebebe guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi xmlAttrib term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#ee82ee
    CSAHi slideSeperator term=NONE cterm=NONE ctermbg=80 ctermfg=33 gui=NONE guibg=#2d2d30 guifg=#672179
    CSAHi diffLine term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#06989a
    CSAHi nunitSectionAttribute term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#5bff80
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#1e1e1e
    CSAHi Error term=reverse cterm=bold,underline ctermbg=64 ctermfg=fg gui=bold,underline guibg=#ff0000 guifg=fg
    CSAHi Todo term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#d69d85
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#b5cea8
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#2b91af
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=22 gui=bold guibg=bg guifg=#2b91af
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi StatusLine term=bold,reverse cterm=bold ctermbg=22 ctermfg=79 gui=bold guibg=#0071cc guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=80 ctermfg=fg gui=bold guibg=#2d2d30 guifg=fg
    CSAHi VertSplit term=reverse cterm=reverse ctermbg=33 ctermfg=33 gui=reverse guibg=#68217a guifg=#68217a
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=21 ctermfg=fg gui=NONE guibg=#264f78 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#ff0000
    CSAHi MyTagListTagName term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Note term=NONE cterm=NONE ctermbg=28 ctermfg=fg gui=NONE guibg=#00ff00 guifg=fg
    CSAHi WordUnderTheCursor term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#014343 guifg=fg
    CSAHi cFormat term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#80ff80
    CSAHi cTagsNamespace term=NONE cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#add8e6
    CSAHi cStructure term=NONE cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#569cd6
    CSAHi cTagsDefinedName term=NONE cterm=NONE ctermbg=bg ctermfg=54 gui=NONE guibg=bg guifg=#bd63c5
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#020202 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#2d2d30 guifg=fg
    CSAHi StatusLineTerm term=bold,reverse cterm=bold ctermbg=45 ctermfg=80 gui=bold guibg=#90ee90 guifg=#1e1e1e
    CSAHi StatusLineTermNC term=reverse cterm=NONE ctermbg=45 ctermfg=80 gui=NONE guibg=#90ee90 guifg=#1e1e1e
    CSAHi Cursor term=NONE cterm=NONE ctermbg=28 ctermfg=fg gui=NONE guibg=#00ff00 guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=87 ctermfg=80 gui=NONE guibg=#dcdcdc guifg=#1e1e1e
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=21 ctermfg=fg gui=NONE guibg=#008b8b guifg=fg
    CSAHi NERDTreeDir term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#a6ca54
    CSAHi cTagsClass term=NONE cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#4ec9b0
    CSAHi NERDTreeCsharpDesignerFile term=NONE cterm=NONE ctermbg=bg ctermfg=82 gui=NONE guibg=bg guifg=#7a7a7a
    CSAHi NERDTreeCsharpSolutionFile term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#cab4fa
    CSAHi NERDTreeCsharpProjectFile term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#8fc1ff
    CSAHi qfFileName term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#cab4fa
    CSAHi qfCsError term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ff5b5e
    CSAHi qfCsWarning term=NONE cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#feff5b
    CSAHi ExtraWhitespace term=NONE cterm=NONE ctermbg=69 ctermfg=fg gui=NONE guibg=#ff5b5e guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi MyTagListFileName term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=#9b9b9b
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi DiffAdd term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi DiffChange term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=31 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi Conceal term=NONE cterm=NONE ctermbg=84 ctermfg=86 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
endif

if 1
    delcommand CSAHi
endif
