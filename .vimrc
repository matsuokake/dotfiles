"===== 表示設定 =====
set number "行番号の表示
set title "編集中ファイル名の表示
set showmatch "括弧入力時に対応する括弧を示す
set list "タブ、空白、改行を可視化
set visualbell "ビープ音を視覚表示
set laststatus=2 "ステータスを表示
set ruler "カーソル位置を表示
syntax on "コードに色をつける
colorscheme molokai

"===== 文字、カーソル設定 =====
set fenc=utf-8 "文字コードを指定
set virtualedit=onemore "カーソルを行末の一つ先まで移動可能にする
set autoindent "自動インデント
set smartindent "オートインデント
set expandtab   "タブキーをタイプしたときに、タブの代わりにスペースを入力
set softtabstop=4 "タブキーを入力した時のスペースの数
set shiftwidth=4 "自動的に入力されたインデントの空白を4つ分に設定
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮ "不可視文字の指定
set whichwrap=b,s,h,l,<,>,[,],~ "行頭、行末で行のカーソル移動を可能にする
set backspace=indent,eol,start "バックスペースでの行移動を可能にする
" let &t_ti.="\e[5 q" "カーソルの形状を変更
let &t_ti.="\e[1 q" "カーソルの形状をデフォルトにする
let &t_SI.="\e[5 q" "カーソルの形状をデフォルトにする
let &t_EI.="\e[1 q" "カーソルの形状をデフォルトにする
let &t_te.="\e[0 q" "カーソルの形状をデフォルトにする
set clipboard=unnamed,autoselect "クリップボードにコピー可能にする

"===== 検索設定 =====
set ignorecase "大文字、小文字の区別をしない
set smartcase "大文字が含まれている場合は区別する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索した文字を強調
set incsearch "インクリメンタルサーチを有効にする
"ESC連打でハイライト解除"
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"===== マウス設定 =====
set mouse=a
set ttymouse=xterm2


"===== dein.vimのスクリプト ====
if &compatible
  set nocompatible
endif

" dein.vimインストール時に指定したディレクトリを指定
let s:dein_dir = expand('~/.cache/dein')

" dein.vimの実体があるディレクトリをセット（指定）
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" deinの起動
if dein#load_state(s:dein_dir)
 call dein#begin(s:dein_dir)

 " tomlファイル（使用するプラグインのリストが記述されているファイル）の場所を指定
 let g:rc_dir = expand('~/.vim/dein') "<- dein.toml dein_lazy.toml を読み込むディレクトリ
 let s:toml = g:rc_dir . '/dein.toml'
 let s:lazy_toml = g:rc_dir . '/dein_lazy.toml' "<- dein_lazy.toml を使う場合はコメント解除

 " tomlファイルを読み込む
 call dein#load_toml(s:toml, {'lazy': 0})
 call dein#load_toml(s:lazy_toml, {'lazy': 1}) "<- dein_lazy.toml を使う場合はコメント解除

  "設定の終了
  call dein#end()
  call dein#save_state()
endif

"Required
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"====dein.vimのスクリプト終了====

"====NERDTreeの設定====
"Ctrl + e でTreeを表示・非表示
map <C-e> :NERDTreeToggle<CR> 

"====vim-clangの設定====
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ --pedantic-errors'

"====vim-airlineの設定
let g:airline_theme = 'molokai'
let g:airline#extensions#tabline#enabled = 1 "上の部分にも色を付ける
let g:airline#extensions#tabline#buffer_idx_mode = 1 "tabの部分に番号をつける

" "====背景を投下させる設定====
" highlight Normal ctermbg=none
" highlight NonText ctermbg=none
" highlight LineNr ctermbg=none
" highlight Folded ctermbg=none
" highlight EndOfBuffer ctermbg=none 
