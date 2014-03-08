set nocompatible        " vim の拡張機能を有効
set hidden              " 編集中でも保存せずに他のファイルを開ける
set confirm             " ファイルの保存を確認するダイアログを出す
set cmdheight=2         " コマンドラインの高さ
set showcmd             " 入力したコマンドを表示
set scrolloff=5         " カーソルの上下に表示される行数の最小値
set vb t_vb=            " ビープを鳴らさない

" Bundles
" ---------------------
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Define bundles via Github repos
Bundle 'unite.vim'
Bundle 'itchyny/lightline.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Shougo/neocomplcache'
Bundle 'tpope/vim-fugitive'
Bundle 'tomtom/tcomment_vim'

filetype plugin indent on

" Bundle setting
nnoremap [bundle] <Nop>
nmap     <Space>b [bundle]
nnoremap <silent> [bundle]i :<C-u>BundleInstall<CR>
nnoremap <silent> [bundle]c :<C-u>BundleClean<CR>
nnoremap <silent> [bundle]s :<C-u>BundleSearch<CR>
nnoremap <silent> [bundle]u :<C-u>BundleUpdate<CR>

set rtp+=~/.vim/plugin/

" ステータスライン
" --------------------
set laststatus=2        " ステータスラインを常に表示する
set ruler               " ルーラを表示する

" インデント
" --------------------
set autoindent          " オートインデント
set smartindent         " 改行時にオートインデント
set expandtab           " tab -> spaces
filetype plugin indent on       " ファイルタイプに合わせたインデントを利用
if has("autocmd")
  autocmd FileType perl setlocal ts=4 sts=4 sw=4
endif

" 表示
" --------------------
set number              " 行番号を表示
set showmatch           " 括弧の対応をハイライト
set cursorline          " カーソル行のハイライト

" コマンド補完
" --------------------
set wildmenu            " コマンド補完を有効化
set wildchar=<tab>      " TABキーでコマンド補完を開始
set history=1000        " 履歴数
set wildmode=list:longest,list:full  " リスト表示, 最長マッチ

" Unite.vim
" --------------------
let g:unite_enable_start_insert = 1

nnoremap [unite] <Nop>
nmap     <Space>u [unite]
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file file/new<CR>
nnoremap <silent> [unite]n :<C-u>Unite file/new<CR>
nnoremap <silent> [unite]d :<C-u>Unite directory_mru<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]s :<C-u>Unite snippet<CR>
nnoremap <silent> [unite]m :<C-u>Unite mapping<CR>

" neocomplcache
" --------------------

" Disable AutoComplPop
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" アンダーバー区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 2

" ポップアップに表示される候補の数
let g:neocomplcache_max_list = 20

let g:neocomplcache_skip_auto_completion_time = '0.3'

" Define dictionary
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Define keyword 
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mapping
inoremap <expr><C-g>    neocomplcache#undo_completion()
inoremap <expr><C-l>    neocomplcache#complete_common_string()
inoremap <expr><C-h>    neocomplcache#smart_close_popup()."\<C-h>"

" Fugitive
" --------------------
nnoremap [fugitive] <Nop>
nmap     <Space>g [fugitive]
nnoremap [fugitive]d :<C-u>Gdiff<CR>
nnoremap [fugitive]s :<C-u>Gstatus<CR>
nnoremap [fugitive]l :<C-u>Glog<CR>
nnoremap [fugitive]a :<C-u>Gwrite<CR>
nnoremap [fugitive]c :<C-u>Gcommit<CR>
nnoremap [fugitive]C :<C-u>Git commit --amend<CR>
nnoremap [fugitive]b :<C-u>Gblame<CR>

" 検索
" --------------------
set wrapscan            " 最後まで検索したら先頭へ
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 大文字が含まれていたら区別する
set hlsearch            " 強調表示
set incsearch           " インクリメンタルサーチ

" 色
" --------------------
syntax enable           " ハイライトを有効化
syntax on
set background=dark
let g:solarized_termcolors=256  " 256色モード
colorscheme solarized

" エンコーディング
" --------------------
set ffs=unix,dos,mac    " 改行文字
set encoding=utf-8      " デフォルトエンコーディング
set fileencoding=utf-8

" バックアップ
" --------------------
set backup              " バックアップを有効化
set backupdir=~/.vim_backup
set swapfile            " スワップファイルを作成
set directory=~/.vim_swap

" 移動
" --------------------

" insert mode 中のカーソル移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

" Keymap
" ---------------------
nnoremap <silent> <Space><Space> :<C-u>source ~/.vimrc<CR>
nnoremap <Esc><Esc> :<C-u>set nohlsearch<CR>

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q  <Nop>
