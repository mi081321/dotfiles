"デフォルトの文字コード
"set encoding=utf-8
set fileencoding=cp932
"文字コードの自動認識
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8,latin1

scriptencoding cp932

"ファイルフォーマット
set fileformats=dos,mac,unix

"---------------OS依存---------------"
"ランタイムパス
"環境変数を設定してください
set runtimepath+=$HOME/dotfiles

"------------------------------------"

" ハイライトを有効にする
if &t_Co > 2 || has('gui_running')
  syntax on
endif

"mql4 にシンタックスハイライトを適用する
"filetype を C にするだけなんですけどね
au BufNewFile,BufRead *.mq4 set filetype=c
au BufNewFile,BufRead *.mq4 set cindent
au BufNewFile,BufRead *.mqh set filetype=c
au BufNewFile,BufRead *.mqh set cindent

"UNDOファイルを作成しません
set noundofile
"バックアップしません
set nobackup
"スワップファイルを作成しません
set noswapfile

"タブサイズは4です
set tabstop=4
set shiftwidth=4
set softtabstop=4
"オートインデント
set autoindent
"高度なインデント
set smartindent

"行番号表示
set number
"行末と行頭をつなげる
set whichwrap=b,s,h,l,<,>,[,]

"横スクロールした時にスクロールする値
set sidescroll=1
set sidescrolloff=4

"マウス操作が捗るらしい
set mouse=a

"スクリーン対応
if &term == "screen"
	set ttymouse=xterm2
endif

"デフォルトのウィンドウサイズ
set lines=40
set columns=150

"ウィンドウの表示位置（左上の座標）
:winpos 20 25

"デフォルトの画面分割（下に分割）
set splitbelow

"クリップボードをWindowsと連携
set clipboard=unnamed

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"検索時に大文字を含んでいたら大/小を区別
set ignorecase 
set smartcase
"検索をファイルの先頭へループしない
set nowrapscan
"検索結果をハイライトする
set hlsearch

"自動改行しない
set nowrap

"バックスペースが使えるよ
set backspace=start,eol,indent

"不可視文字を表示
set list
set listchars=tab:>-,nbsp:･,trail:･,eol:｣,extends:>,precedes:<
highlight SpecialKey term=underline ctermfg=darkgray guifg=darkgray
highlight NonText term=underline ctermfg=darkgray guifg=darkgray
"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90

"grep 実行時、自動で Quickfix を表示します
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen | endif

"grep 実行時、指定した拡張子をファイル検索から除外します
autocmd QuickFixCmdPre * setlocal wildignore=*.exe,*.app,*.ocx,*.jpg,*.png,*.bmp,*.gif,*.class,*.jar,*.apk,*.lib,*.dll,*.obj,*.bin,*.pdb,*.exp,*.lik,*.dat,*.avi,*.mp4,*.wmv,*.zip,*.cab
autocmd QuickFixCmdPost * setlocal wildignore=

"外部 grep を利用します（cygwin）
set grepprg=c:/cygwin/bin/grep\ -nH\ -r 

">>> プラグイン系の設定 >>>
"-------------------------------------------------------------------
"NeoBundle
"-------------------------------------------------------------------
" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" neobundle.vimの初期化
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

" NeoBundleを更新するための設定
NeoBundleFetch 'Shougo/neobundle.vim'

" 読み込むプラグインを記載
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'vobornik/vim-mql4'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomtom/tcomment_vim'

" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

" インストールのチェック
NeoBundleCheck

"-------------------------------------------------------------------
"lightline
"-------------------------------------------------------------------
let g:lightline = {
\	'colorscheme': 'wombat'
\	}

"-------------------------------------------------------------------
"Quickrun
"-------------------------------------------------------------------
"Quickrunの実行結果の表示位置
let g:quickrun_config={
\	"_": {
\		"outputter/buffer/split" : ":botright 8sp",
\	}
\}

"<<< プラグイン系の設定 <<<

