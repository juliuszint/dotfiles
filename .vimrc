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

if has('gui_running')
  :set guifont=Consolas:h11:cANSI
  :set guioptions-=m  " remove menu bar
  :set guioptions-=T  " remove toolbar
  :set guioptions-=r  " remove right-hand scroll bar
  :set guioptions-=L  " remove left-hand scroll bar
  :colorscheme morning
  if has("win32")
	 " Windows options here
	 au GUIEnter * simalt ~x " launch gvim in fullscreen
  else
	  " Linux and MacOSX options here
  endif

endif

:set complete=.,w,b,u,t,i,kspell " these are the default vim settings with kspell added (search in dictionary only if spell is enabled) 
:set nocompatible  " Use Vim settings, rather then Vi settings
:set nobackup
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
