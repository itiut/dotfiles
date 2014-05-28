" encoding
set encoding=utf-8

" file
set nobackup        " do not create backup files
set noswapfile      " do not create swap files

" buffer
set autoread        " automatically reload if changed outside
set hidden          " hide buffer even if unsaved

" syntax
syntax enable

" display
set laststatus=2    " 2-line status
set list            " tabs, trailing spaces
set listchars=tab:»-,trail:-,extends:»,precedes:«
set matchtime=2     " seconds to show matching brackets
set nowrap          " disable line wrap
set number          " line numbers
set ruler           " line and column number of cursor
set showcmd         " command characters
set showmatch       " matching brackets
set showmode        " current mode
set title           " file name on window title

" search
set hlsearch        " highlight search matches
set incsearch       " highlight first search match when typing search string
set ignorecase      " ignore case
set smartcase       " do not ignore case when search string contains uppercase letters

" tab
set expandtab       " replace tab with spaces
set tabstop=4       " tab width
set shiftwidth=4    " number of spaces for each indentation

" indentation
set autoindent
set smartindent

" key binding
" ESC by C-g
inoremap <C-g> <ESC>
" stop highlighting search matches by ESC ESC
nnoremap <ESC><ESC> :noh<CR>
