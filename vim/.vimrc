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
:set incsearch     " do incremental searching
:set ignorecase
:set smartcase     " search string with UpperCaseLetter -> case sensitiv, only lowercaseletters -> case insensitiv
:set expandtab

if has("win32") " when running on windows
	:set guifont=DejaVu_Sans_Mono:h10:cANSI:qDRAFT
    au GUIEnter * simalt ~x " launch gvim in fullscreen
else
    :set guifont=DejaVu\ Sans\ Mono\ 12
endif

if has('gui_running')
    :set guioptions-=m  " remove menu bar
    :set guioptions-=T  " remove toolbar
    :set guioptions-=r  " remove right-hand scroll bar
    :set guioptions-=L  " remove left-hand scroll bar
    :colorscheme visualstudio
endif

" fix indentation with alt-i // get overwritten in ftp plugin
nmap é <esc>ma=4{'a

" keyboard mappings
nmap î :cn<cr> 
nmap í :cp<cr>
imap Ó <esc>:w<cr>
nmap Ã :bd<cr>
nmap Ó :w<cr>

" Quicker Start/End Line
noremap H ^
noremap L $
" more natural screen movement mac
nnoremap º <C-d>
nnoremap ∆ <C-u>

" More ergonomic Block movment
nnoremap <S-j> }
nnoremap <S-k> {
nnoremap <C-j> $mb:join<cr>`b
vnoremap <S-j> }
vnoremap <S-k> {

"better intenting in visual mode
vnoremap <Tab> > gv
vnoremap <S-Tab> < gv
" compiling <AltGr-b>
nnoremap <silent>Â :Build<cr>

nmap <space> @@
nmap ö ;
nmap Ö :
nmap ä '
nmap Ä "
nmap ü [
nmap Ü {
nmap ^ `
nmap ° ~
nnoremap - /
nnoremap _ ?
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
imap <M-7> {
imap <M-0> }
imap <M-8> [
imap <M-9> ]
nmap <M-j> <C-d>
nmap <M-k> <C-u>
nmap <M-l> <C-w>l
nmap <M-h> <C-w>h
imap <M-p> <C-p>

" open explorer
map € :E<cr>

" Xaml
au BufNewFile,BufRead *.xaml        setf xml

" scripting
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

function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

:syntax on
:filetype plugin indent on
:filetype indent on
:filetype on

" easy plugin management 
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

" netwr config
let g:netrw_bufsettings = 'nu'
