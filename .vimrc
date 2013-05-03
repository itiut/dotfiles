" encoding
set encoding=utf-8

" do not create backup files
set nobackup

" do not create swap files
set noswapfile

" print line numbers
set number

" print file names on window title
set title

" print commands on status line
set showcmd

" always show status line
set laststatus=2

" highlight according parenthesis when closing
set showmatch
set matchtime=2

" show tabs and trailing blanks
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«

" replace tab with spaces
set expandtab

" tab size
set tabstop=4
set shiftwidth=4
set softtabstop=0

" indentation
set autoindent
set smartindent

" ESC by C-g
inoremap <C-g> <ESC>

" syntax
syntax enable
