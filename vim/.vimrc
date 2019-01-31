:set encoding=utf8
:set number
:set nowrap
:set vb
:set backspace=2
:set complete=.,w,b,u,t,i,kspell
:set nocompatible
:set nobackup
:set cursorline
:set nowritebackup
:set noswapfile
:set history=500
:set ruler
:set showcmd
:set laststatus=2
:set clipboard=unnamed
:let mapleader=","
:set autoread
:set hidden
:set errorformat=\ %#%f(%l\\\,%c):\ %m
:set timeoutlen=500

:set wrapscan
:set smartcase
:set ignorecase
:set incsearch
:set hlsearch

:set expandtab
:set shiftwidth=4
:set softtabstop=4
:set autoindent
:set cinoptions=W(0,W1s,l1s
:filetype plugin indent on
:colorscheme visualstudioterm

:syntax on

:let g:WebDevIconsUnicodeDecorateFolderNodes = 1
:let g:NERDTreeIgnore=['.*obj$[[dir]]', '.*bin$[[dir]]']
:let g:NERDTreeHijackNetrw=1
:let g:NERDTreeWinSize=60
:let g:AutoPairsShortcutToggle=''

:let g:agprg = 'ag --group --column --path-to-ignore ~/.ignore'

" fzf setup
:set rtp+=/usr/local/opt/fzf

" ultisnip setup
:let g:UltiSnipsExpandTrigger="<tab>"

:command! -complete=file -nargs=+ Ag :call SearchWithAg(<f-args>)

if has('macunix')
    imap <D-c> <esc>:w<cr>
    imap <D-7> {
    imap <D-0> }
    imap <D-8> [
    imap <D-9> ]
    imap <D-p> <C-p>

    nmap <D-Enter> :set fu<cr>
    nmap <D-c> <esc>:w<cr>
    nmap <D-j> <C-d>
    nmap <D-k> <C-u>
    vmap <D-j> <C-d>
    vmap <D-k> <C-u>
    nmap <D-c> :Bclose<cr>
    nmap <D-n> :cn<cr>
    nmap <D-N> :cp<cr>
    nmap <D-b> :Buffers<cr>
    nmap <D-f> :call fzf#run({'source': 'git ls-files', 'sink': 'e', 'down': '20'})<cr>
    nmap <D-v> :vsp<cr>
    nmap <D-t> :Tags<cr>
    nmap <D-a> :Ag 

    nmap <D-e> :e .<cr>

    nmap <D-s> :w<cr>
    imap <D-s> <esc>:w<cr>
    inoremap <D-n> <C-n>
endif

if has("win32")
    imap <M-7> {
    imap <M-0> }
    imap <M-8> [
    imap <M-9> ]
    imap <M-p> <C-p>

    nmap <M-j> <C-d>
    nmap <M-k> <C-u>
    nmap <M-l> <C-w>l
    nmap <M-h> <C-w>h
    nmap <M-n> :cn<cr>
    nmap <M-m> :cp<cr>

    " Ó Alt-Gr-s
    " Ã Alt-Gr-c
    imap Ó <esc>:w<cr>
    nmap Ó :w<cr>
    nmap Ã :bd<cr>
endif

nmap go <C-o>
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l
nmap gh <C-w>h
nmap gd <C-]>
nmap gi <C-i>
nmap gm :call ExecuteMake()<cr>
nmap zr :echo 'running project ...'<cr>:call ProjectRun()<cr>:echo 'done'<cr>

nmap gur :call RunUnitTests()<cr>
nmap gfu :call FindUsagesForWordUnderCursor()<cr>
nmap gfi :call FindImplementationForWordUnderCursor()<cr>
nmap gut :call UpdateTags()<cr>
nmap gnh :noh<cr>
vmap gkc :s/^/\/\/<cr>:noh<cr>
vmap gku :s/^\/\//<cr>:noh<cr>
nmap ggs :call GitStatus()<cr>
nmap gca :%bd<cr>

vnoremap <Tab> > gv
vnoremap <S-Tab> < gv

" default of H (move to top of the screen)
" default of L (move to bottom of the screen)
" default of K (open man page for word under the cursor)
" default of J (join lines -> replaced with <C-j>)
noremap H ^
noremap L $
nnoremap J }
nnoremap K {
vnoremap J }
vnoremap K {
nnoremap <C-j> $mb:join<cr>`b

nnoremap - /
nnoremap _ ?
nmap <space> @@
nmap <S-Tab> :b#<cr>
nmap ö ;
nmap Ö :
nmap ä '
nmap Ä "
nmap ü [
nmap Ü {
nmap ^ `
nmap ° ~
vmap ö ;
vmap Ö :
vmap ä '
vmap Ä "
vmap ü [
vmap Ü {
vmap ^ `
vmap ° ~
vnoremap - /
vnoremap _ ?
if has("autocmd")

    :autocmd FileType qf wincmd J
    :autocmd VimEnter * call LoadProjectVimrc()
    :autocmd BufNewFile,BufRead *.xaml setf xml
    :autocmd BufNewFile,BufRead *.nunit setf xml
    :autocmd FileType cs,slide :setlocal colorcolumn=110

    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()

    augroup templates
        autocmd BufNewFile *.cs 0r ~/.vim/templates/skeleton.cs
    augroup END
endif

function! LoadProjectVimrc()
    if filereadable('project.vim')
        execute 'source' 'project.vim'
    endif
endfunction

function! UpdateTags()
    if exists("*ProjectUpdateTags")
        :echo "updating tags with project settings ..."
        :call ProjectUpdateTags()
    else
        :echo "updating tags ..."
        :let output = system('ctags -R .')
    endif
    :redraw!
    :echo "done"
endfunction

function! RunUnitTests()
    :echo "running unit tests ..."
    :let start = reltime()
    :let nunitoutput = system("nunit mac.nunit")
    :let elapsedTimeString = reltimestr(reltime(start))
    :let failedTests = matchstr(nunitoutput, 'Failed: \(\d*\),')
    :let runTests = matchstr(nunitoutput, 'Test Count: \(\d*\),')
    :call ShowInReadonlyBuffer(nunitoutput, 1, 'nunit')
    :echo "finished in:" . elapsedTimeString "s. " . runTests . " " . failedTests
    :redraw!
endfunction

function! ExecuteMakeClean()
    :echo ""
    :echo "clean started ..."
    :let start = reltime()
    :let buildoutput = system("make clean")
    :let elapsedTimeString = reltimestr(reltime(start))
    :redraw!
    :echo "make clean finished in:" . elapsedTimeString . "s"
endfunction

function! ExecuteMake()
    echo ""
    try
        :silent :execute ":w"
    catch
    endtry
    :echo "make started ..."
    :let start = reltime()
    :let buildoutput = system("make")
    :let elapsedTimeString = reltimestr(reltime(start))
    if buildoutput=~#'\cerror' || buildoutput=~#'\cwarning'
        :copen
    else
        :cclose
    endif
    :cexp buildoutput
    :redraw!
    :echo "make task finished in:" . elapsedTimeString . "s"
endfunction

function! FindImplementationForWordUnderCursor()
    :echo "looking for implementations ..."
    let wordUnderCursor = expand("<cword>")
    :silent :execute 'vimgrep /\(class\|interface\)\_[^{]\{-}' . wordUnderCursor .  '/gj ./**/*.cs'
    :copen
    :redraw!
endfunction

function! FindUsagesForWordUnderCursor()
    echo "looking for usages ..."
    let wordUnderCursor = expand("<cword>")
    let query = "\"\\b" . wordUnderCursor . "\\b\""
    let queryCommand = g:agprg . ' ' . query
    let agoutput = system(queryCommand)
    call ShowInReadonlyBuffer(agoutput, 1, 'ag')
    redraw!
endfunction

function! SearchWithAg(...)
    echo "searching ..."
    let l:queryCommand = g:agprg
    for l:args in a:000
        let l:queryCommand = l:queryCommand . ' ' . l:args
    endfor
    let agoutput = system(queryCommand)
    call ShowInReadonlyBuffer(agoutput, 1, 'ag')
    redraw!
endfunction

function GitStatus()
    :let gitstatusoutput = system("git status")
    :let gitdiffoutput = system("git diff")
    :call ShowInReadonlyBuffer(gitstatusoutput . gitdiffoutput, 1, 'git')
endfunction

function! ShowInReadonlyBuffer(content, preferInactiveWindowSplit,...)
    if a:preferInactiveWindowSplit
        call EnsureTopRowHasTwoColumns()
        let inactiveWindowId = GetInactiveTopRowWindow()
        let windowState = winnr()
        exe inactiveWindowId . "wincmd w"
    endif

    " create buffer, paste content and configure buffer
    :enew
    :$put=a:content
    :setlocal buftype=nofile
    :setlocal nomodifiable
    :setlocal nobuflisted
    :setlocal bufhidden=delete

    if a:0 == 1
        execute 'setlocal filetype=' . a:1
    endif

    " restore active window
    if a:preferInactiveWindowSplit
        exe windowState . "wincmd w"
    endif
endfunction

function! GetInactiveTopRowWindow()
    let currentWindow = winnr()
    let openWindows = range(1,winnr('$'))
    for w in openWindows
        let screenPos = win_screenpos(w)
        if screenPos[0] == 1 && w != currentWindow
            return w
        endif
    endfor
endfunction

function! EnsureTopRowHasTwoColumns()
    let openWindows = range(1,winnr('$'))
    let topLeftWindowId = -1
    let topRowColumns = 0
    for w in openWindows
        let screenPos = win_screenpos(w)
        if screenPos[0] == 1
            let topRowColumns = topRowColumns + 1
            if screenPos[1] == 1
                let topLeftWindowId = w
            endif
        endif
    endfor
    if topRowColumns <= 1
        let windowState = winnr()
        exe topLeftWindowId . "wincmd w"
        :vsp
        exe windowState . "wincmd w"
    endif
endfunction

"
" Evaluate and print current syntax stack for word under cursor
"
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

execute pathogen#infect()

" Show highlighting group for current word
nmap <C-i> :call <SID>SynStack()<CR>
