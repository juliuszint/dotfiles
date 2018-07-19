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
:set hlsearch    
:set laststatus=2  
:set encoding=utf-8
:set clipboard=unnamed
:let mapleader=","
:set shiftwidth=4
:set tabstop=4
:set nowrapscan
:set autoindent
:set incsearch     
:set ignorecase
:set smartcase    
:set expandtab
:set hidden
:set colorcolumn=110
:syntax on
:filetype plugin indent on
:filetype indent on
:filetype on
:set errorformat=\ %#%f(%l\\\,%c):\ %m
:set timeoutlen=500

:let NERDTreeIgnore=['.*obj$[[dir]]', '.*bin$[[dir]]']
:let g:NERDTreeHijackNetrw=1
:let g:NERDTreeWinSize=60
:let g:AutoPairsShortcutToggle=''
:let g:ctrlp_working_path_mode = 'a'
:let g:ctrlp_cmd = 'CtrlP'

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
    
    nmap <D-p> :CtrlP<cr>
    nmap <D-b> :CtrlPBuffer<cr>
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

    nmap <M-p> :CtrlP<cr>
endif

nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l
nmap gh <C-w>h
nmap gd <C-]>
nmap go <C-o>
nmap gi <C-i>
nmap gm :call ExecuteMake()<cr>
nmap zr :call system('open /Volumes/awin/notenboxacht/source/notenbox.mac/bin/Debug/NotenBox.app')<cr>:echo "launching application ..."<cr>

nmap gur :call RunUnitTests()<cr>
nmap gfu :call FindUsagesForWordUnderCursor()<cr>
nmap gfi :call FindImplementationForWordUnderCursor()<cr>
nmap gtu :!ctags -R . /Volumes/awin/frameworkSource/xamarin.mac<cr> :redraw!<cr>:echo "updated tags"<cr>
nmap gnh :noh<cr>
vmap gkc :s/^/\/\/<cr>:noh<cr>
vmap gku :s/^\/\//<cr>:noh<cr>
nmap ggs :call GitStatus()<cr>

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

:autocmd FileType nerdtree :setlocal colorcolumn=0
:autocmd FileType qf :setlocal colorcolumn=0
:autocmd FileType qf wincmd J
:autocmd BufNewFile,BufRead *.xaml setf xml

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
    if buildoutput=~#"Error"
        :copen
        :cexp buildoutput
    else
        :cclose
    endif
    :redraw!
    :echo "make task finished in:" . elapsedTimeString . "s"
endfunction

function FindImplementationForWordUnderCursor()
    :echo "looking for implementations ..."
    let wordUnderCursor = expand("<cword>")
    :silent :execute 'vimgrep /\(class\|interface\)\_s\+\w*\_s\+:\_s*\(\w+\_s*,\)*\_s*' . wordUnderCursor .  '/gj ./**/*.cs'
    :copen
    :redraw!
endfunction

function FindUsagesForWordUnderCursor()
    :echo "looking for usages ..."
    let wordUnderCursor = expand("<cword>")
    :silent :execute "vimgrep /\\<" . wordUnderCursor .  "\\>/gj ./**/*.cs"
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

let g:ctrlp_custom_ignore = {
  \ 'file': '\.cache$\|\.exe$\|\.obj$\|\.dll$'
  \ }

" Show highlighting group for current word
nmap <C-i> :call <SID>SynStack()<CR>
