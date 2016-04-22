:set number
:set nowrap
:set vb
:set backspace=2   " Backspace deletes like most programs in insert mode

if has("win32")
  " Windows options here
  :compiler msvc
else
  " Linux and MacOSX options here
endif

" Show highlighting group for current word
nmap <C-i> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
	if has('gui_running')
	if has("win32")
		:set guifont=Consolas:h11:cANSI
	else
		if has("unix")
		  let s:uname = system("uname")
		  if s:uname == "Darwin\n"
			" MacOsX
			:set guifont=Consolas:h12
		  else
			" linux font settings
		  endif
		endif
	endif
	:set guioptions-=m  " remove menu bar
	:set guioptions-=T  " remove toolbar
	:set guioptions-=r  " remove right-hand scroll bar
	:set guioptions-=L  " remove left-hand scroll bar
        :colorscheme visualstudio
	  if has("win32")
		 " Windows options here
		 au GUIEnter * simalt ~x " launch gvim in fullscreen
	  else
		  " Linux and MacOSX options here
	  endif

	endif

set encoding=utf-8

" http://vim.wikia.com/wiki/Map_extra_keys_on_non_US_keyboards
map ü <C-]>
map Ü <C-t>
map ö [
map ä ]
map Ö {
map Ä }
map ß /

" Quicker Compile Shortcuts
nmap <F5> :make<cr><cr>:cw<cr>
nmap <F2> :cp<cr>
nmap <F3> :cn<cr>

" Quicker window movement
"nnoremap <C-j> <C-w>j interferse with join command
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Faster save
nnoremap <C-s> :w<cr>

" More ergonomic Block movment
nnoremap <S-j> }
nnoremap <S-k> {
nnoremap <C-j> $mb:join<cr>`b

" map backtick to single qouote to make it easier to jump to marks
nnoremap ' `
nnoremap ` '

:set complete=.,w,b,u,t,i,kspell " these are the default vim settings with kspell added (search in dictionary only if spell is enabled) 
:set nocompatible  " Use Vim settings, rather then Vi settings
:set nobackup
:set cursorline    " enables highlighting the complete cursorline
:set nowritebackup
:set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
:set history=500
:set ruler         " show the cursor position all the time
:set showcmd       " display incomplete commands
:set incsearch     " do incremental searching
:set hlsearch      " highlight matches
:set laststatus=2  " Always display the status line

:set relativenumber

:syntax on
:filetype plugin indent on
:filetype indent on
:filetype on

" easy plugin management 
execute pathogen#infect() 


