"===== 表示設定 =====
set number "行番号の表示
set title "編集中ファイル名の表示
set showmatch "括弧入力時に対応する括弧を示す
set list "タブ、空白、改行を可視化
set visualbell "ビープ音を視覚表示
set laststatus=2 "ステータスを表示
set ruler "カーソル位置を表示
syntax on "コードに色をつける
colorscheme ghdark

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
imap <C-b> <Left>
imap <C-f> <Right>

"set clipboard&    "クリップボードにコピー可能にする
"set clipboard^=unnamedplus

"===== 検索設定 =====
set ignorecase "大文字、小文字の区別をしない
set smartcase "大文字が含まれている場合は区別する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索した文字を強調
set incsearch "インクリメンタルサーチを有効にする
"ESC連打でハイライト解除"
nmap <Esc><Esc> :nohlsearch<CR><Esc>
"
"===== マウス設定 =====
set mouse=a
set ttymouse=xterm2


"=====vim plugの設定=====
call plug#begin()
Plug 'wojciechkepka/vim-github-dark'
Plug 'cohama/lexima.vim'
Plug 'lambdalisue/fern.vim'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"=====fernの設定=====
" Ctrl+nでファイルツリーを表示/非表示する
nnoremap <C-e> :Fern . -reveal=% -drawer -toggle -width=40<CR>

"====vim-airlineの設定
let g:airline_theme = 'molokai'
" let g:airline#extensions#tabline#enabled = 1 "上の部分にも色を付ける
" let g:airline#extensions#tabline#buffer_idx_mode = 1 "tabの部分に番号をつける

" "====背景を透過させる設定====
" highlight Normal ctermbg=none
" highlight NonText ctermbg=none
" highlight LineNr ctermbg=none
" highlight Folded ctermbg=none
" highlight EndOfBuffer ctermbg=none 

