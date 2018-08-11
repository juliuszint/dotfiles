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

:syntax on

:let g:WebDevIconsUnicodeDecorateFolderNodes = 1
:let NERDTreeIgnore=['.*obj$[[dir]]', '.*bin$[[dir]]']
:let g:NERDTreeHijackNetrw=1
:let g:NERDTreeWinSize=60
:let g:AutoPairsShortcutToggle=''

" fzf setup
:set rtp+=/usr/local/opt/fzf

:command -nargs=1 Csgrep :vimgrep <args> **/*.cs

if has('macunix')
    imap <D-c> <esc>:w<cr>
    imap <D-7> {
    imap <D-0> }
    imap <D-8> [
    imap <D-9> ]
    imap <D-p> <C-p>

    nmap <D-c> <esc>:w<cr>
    nmap <D-t> :wq<cr>
    nmap <D-j> <C-d>
    nmap <D-k> <C-u>
    vmap <D-j> <C-d>
    vmap <D-k> <C-u>
    nmap <D-c> :Bclose<cr>
    nmap <D-n> :cn<cr>
    nmap <D-N> :cp<cr>
    
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
nmap gff  :call fzf#run({'source': 'git ls-files', 'sink': 'e', 'down': '20'})<cr>
nmap gft  :Tags<cr>

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

:autocmd VimEnter * call LoadProjectVimrc()
:autocmd FileType qf wincmd J
:autocmd BufNewFile,BufRead *.xaml setf xml
:autocmd BufNewFile,BufRead *.nunit setf xml
:autocmd FileType cs :setlocal colorcolumn=110

function! LoadProjectVimrc()
    if filereadable('project.vim')
        execute 'source' 'project.vim'
    endif
endfunction

function UpdateTags()
    :echo "updating tags ..."
    :let tagsoutput = system('ctags -R . /Volumes/awin/frameworkSource/xamarin.mac')
    :redraw!
    :echo "done"
endfunction

function RunUnitTests()
    :echo "running unit tests ..."
    :let start = reltime()
    :let nunitoutput = system("nunit nunit.nunit")
    :let elapsedTimeString = reltimestr(reltime(start))
    :let failedTests = matchstr(nunitoutput, 'Failed: \(\d*\),')
    :let runTests = matchstr(nunitoutput, 'Test Count: \(\d*\),')
    :call ShowInReadonlyBuffer(nunitoutput)
    :setlocal filetype=nunit
    :echo "finished in:" . elapsedTimeString "s. " . runTests . " " . failedTests
    :redraw!
endfunction

function ExecuteMake()
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

function FindImplementationForWordUnderCursor()
    :echo "looking for implementations ..."
    let wordUnderCursor = expand("<cword>")
    :silent :execute 'vimgrep /\(class\|interface\)\_[^{]\{-}' . wordUnderCursor .  '/gj ./**/*.cs'
    :copen
    :redraw!
endfunction

function FindUsagesForWordUnderCursor()
    :echo "looking for usages ..."
    let wordUnderCursor = expand("<cword>")
    :silent :execute 'vimgrep /\<' . wordUnderCursor .  '\>/gj ./**/*.cs'
    :copen
    :redraw!
endfunction

function GitStatus()
    :let gitstatusoutput = system("git status")
    :let gitdiffoutput = system("git diff")
    :call ShowInReadonlyBuffer(gitstatusoutput . gitdiffoutput)
    :setlocal filetype=git
endfunction

function ShowInReadonlyBuffer(content)
    :enew
    :$put=a:content
    :setlocal buftype=nofile
    :setlocal nomodifiable
    :setlocal nobuflisted
    :setlocal bufhidden=delete
    :setlocal colorcolumn=0
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
