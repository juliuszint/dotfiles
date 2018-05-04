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
:set relativenumber
:set encoding=utf-8
:set clipboard=unnamed
:let mapleader="-"
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
    nmap <D-l> <C-w>l
    nmap <D-h> <C-w>h
    nmap <D-c> :bd<cr>
    nmap <M-n> :cn<cr>
    nmap <M-m> :cp<cr>

    nmap <D-s> :w<cr>
    imap <D-s> <esc>:w<cr>
    
    nmap <D-p> :CtrlP<cr>
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

vnoremap <Tab> > gv
vnoremap <S-Tab> < gv

au BufNewFile,BufRead *.xaml setf xml

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

let g:AutoPairsShortcutToggle=''

" ctrl p mapping
" 'c' - the directory of the current file.
" 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
" 'a' - the directory of the current file, unless it is a subdirectory of the cwd
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cmd = 'CtrlP'

" Show highlighting group for current word
nmap <C-i> :call <SID>SynStack()<CR>
