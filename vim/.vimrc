:set number
:set nowrap
:set vb
:set backspace=2   " Backspace deletes like most programs in insert mode
:set complete=.,w,b,u,t,i,kspell " these are the default vim settings with kspell added (search in dictionary only if spell is enabled) 
:set nocompatible  " Use Vim settings, rather then Vi settings
:set nobackup
:set cursorline    " enables highlighting the complete cursorline
:set nowritebackup
:set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
:set history=500
:set ruler         " show the cursor position all the time
:set showcmd       " display incomplete commands
:set hlsearch      " highlight matches
:set laststatus=2  " Always display the status line
:set relativenumber
:set encoding=utf-8
:set clipboard=unnamed
:let mapleader="-"
:set shiftwidth=4  " smooth indentation // overwritten in filetype plugins
:set tabstop=4
:set nowrapscan
:set autoindent
:set incsearch     
:set ignorecase
:set smartcase    
:set expandtab
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
    nmap <M-n> :cn<cr>
    nmap <M-m> :cp<cr>

    nmap <D-s> :w<cr>
    imap <D-s> <esc>:w<cr>
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
" custom compile function
"
function! s:build()
    let &makeprg='build.bat'
    if has("unix")
		let &makeprg='./build.sh'
    endif
    silent make
    :vert copen
	:call feedkeys("\<C-w>=")
endfunction

command! Build call s:build()

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
nmap <M-p> :CtrlP<cr>

" Show highlighting group for current word
nmap <C-i> :call <SID>SynStack()<CR>
