set backspace=start,eol,indent
set whichwrap=b,s,[,],,~
set mouse=a
set incsearch
set wildmenu wildmode=list:full
syntax on
set nohlsearch
set cursorline
set number  

let mapleader = ","
let g:maplocalleader = ","

set autoindent
set shiftwidth=2
set tabstop=2
set expandtab

highlight Normal ctermbg=black ctermfg=grey
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray
   
" vimのバックアップファイル
set directory=~/tmp/.swap
set backupdir=~/tmp/.~

"神田式
noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap <C-j> <C-^>
imap jj <ESC>

nnoremap <silent> <Leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :so $MYVIMRC<CR>


" Anywhere SID.
function! s:SID_PREFIX()
	return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
	let s = ''
	for i in range(1, tabpagenr('$'))
		let bufnrs = tabpagebuflist(i)
		let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
		let no = i  " display 0-origin tabpagenr.
		let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
		let title = fnamemodify(bufname(bufnr), ':t')
		let title = '[' . title . ']'
		let s .= '%'.i.'T'
		let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
		let s .= no . ':' . title
		let s .= mod
		let s .= '%#TabLineFill# '
	endfor
	let s .= '%#TabLineFill#%T%=%#TabLine#'
	return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示"

"The prefix key"
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
   execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
" tp 前のタブ"
map <silent> [Tag]p :tabprevious<CR>


" 挿入モードの矢印の異常挙動の制御 
nnoremap OA gi<Up>
nnoremap OB gi<Down>
nnoremap OC gi<Right>
nnoremap OD gi<Left>


"クリップボードの共有
""set clipboard+=autoselect #有効にするとヤンクの[p]が効かなくなる
set clipboard+=unnamed

set nocompatible " be iMproved
filetype off

if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#rc(expand('~/.vim/bundle/'))
endif
""ここに必要なプラグインを書く
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'
"NeoBundle 'dbext.vim'
NeoBundle 'haya14busa/vim-easymotion'
NeoBundle 'AutoClose'
NeoBundle 'basyura/unite-rails'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc' 
NeoBundle 'alpaca-tc/alpaca_tags'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neocomplcache-rsense.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'tmhedberg/matchit'
"NeoBundle 'Shougo/neosnippet'
NeoBundle 'vim-scripts/Align'
filetype plugin indent on " require
filetype indent on
syntax on

"""""""""Unite-rails"
noremap :rc :<C-u>Unite rails/controller<CR>
noremap :rm :<C-u>Unite rails/model<CR>
noremap :rv :<C-u>Unite rails/view<CR>
noremap :rh :<C-u>Unite rails/helper<CR>
noremap :rs :<C-u>Unite rails/stylesheet<CR>
noremap :rj :<C-u>Unite rails/javascript<CR>
noremap :rr :<C-u>Unite rails/route<CR>
noremap :rg :<C-u>Unite rails/gemfile<CR>
noremap :rt :<C-u>Unite rails/spec<CR>

"""""""""NERDTree"
nmap <F6> :NERDTree<CR>

"""""""""Unite.vims"
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> <Leader>ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> <Leader>uf :<C-u>Unite file<CR>
nnoremap <silent> <Leader>ufa :<C-u>Unite -input=**/* file<CR>
nnoremap <silent> <Leader>ff :<C-u>Unite file<CR>
nnoremap <silent> <Leader>ffa :<C-u>Unite -input=**/* file<CR>
" ファイル一覧(現在開いているファイルのディレクトリ)
nnoremap <silent> <Leader>ufc :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> <Leader>ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> <Leader>um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> <Leader>uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> <Leader>ua :<C-u>Unite buffer file_mru bookmark file<CR>"

"""""""""vimprocの設定 (unite grep)" {{{
" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" " grep検索
nnoremap <silent> <Leader>g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索 
nnoremap <silent> <Leader>cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> <Leader>r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
"}}}


""""""""""easymotion　…使い方がわからないorz
" Lokaltog/vim-easymotion
" http://blog.remora.cx/2012/08/vim-easymotion.html
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「;」 + 何かにマッピング
let g:EasyMotion_leader_key=";"

" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

