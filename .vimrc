" バックアップを作らない
set nobackup

" スワップファイルを作らない
set noswapfile

" 行番号を表示する
set number

" ウィンドウタイトルに編集中のファイル名を表示する
set title

" 入力中のコマンドをステータスに表示する
set showcmd

" ステータスラインを常に表示する
set laststatus=2

" 括弧を閉じたときに対応する括弧を表示する
set showmatch
set matchtime=2

" 不可視文字(タブ,行末スペースなど)を表示する
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«

" タブをスペースに置換する
set expandtab

" タブ幅を4に固定する
set tabstop=4
set shiftwidth=4
set softtabstop=0

" インデントの設定
set autoindent
set smartindent

" インサートモードを Ctrl+g で抜ける
inoremap <C-g> <ESC>

" カラースキーマの設定
syntax enable

