"シンタックス・ハイライトをON
syntax on
hi clear

"leaderを変更
let mapleader = ","
let g:maplocalleader = ","

"set autochdir
set directory=$HOME

"検索結果をハイライト
set hlsearch
"インクリメントな検索を行う
set incsearch

"TITLEを表示する
set title
set titlestring=

"入力中のコマンドを表示
set showcmd

"zshっぽい補完に
set wildmenu wildmode=list:full

"長い行は折り返さない
"set nowrap

"検索をファイルの先頭へループ
set wrapscan

"日本語対応
"set encoding=japan

"let twitvim_count = 100TERMの文字コード
set termencoding=utf-8

"デフォルト文字コード
set fileencoding=utf-8

"文字コード
set fileencodings=utf-8,euc-jp,jis,sjis,ucs-bom,iso-2022-jp,utf-16,cp932,latin1

"他で編集したら自動再読み込み
set autoread

"デフォルトファイルフォーマット
set fileformat=unix

"改行コード
set fileformats=unix,dos,mac

"特殊文字対策(Unicodeのときのみ有効)
set ambiwidth=double

"新しい行のインデントを現在行と同じにする
set autoindent

"新しい行を作ったときに高度な自動インデントを行う
"set smartindent

"インデント設定
set smarttab     "改行時に行末のタブを判断して、インデントしてくれる
set shiftwidth=2 "自動インデントでずれる幅
set tabstop=2    "Tabを押した時にインデントする幅
set expandtab    "Tab入力を半角スペースに置き換えてくれる

" viminfoファイルを作成しない
set viminfo=

"ルーラー表示
set ruler

"行番号を表示
set number

"ファイル名の展開にスラッシュを使う。
set shellslash

"listで表示される文字のフォーマットを指定する
set listchars=eol:<,tab:\|>,extends:<

"タブ文字、行末など不可視文字を表示する
set nolist

"タブが２つ以上になったらタブバーを表示
set showtabline=1

"クリップボード連携
set clipboard=unnamed,autoselect
"vmap <silent> <Leader>y "*y
"if has('gui') | set clipboard= | endif
"set clipboard+=autoselect "有効にするとヤンクの[p]が効かなくなる

"ポップアップメニューをよしなに
set completeopt=menu,preview,longest,menuone

"補完候補の設定
set complete=.,w,b,u,k

"Vi互換をオフ
set nocompatible

"大文字/小文字を区別しない
set ignorecase

"検索語句に大文字が含まれている場合のみ大文字/小文字を区別する
set smartcase

"GREP時に使うプログラム
set grepprg=internal

"コンソールでもマウス機能を
set mouse=a
set guioptions+=a
"screen対応
if &term == "screen" | set ttymouse=xterm-256color | endif

"Backspace"
set backspace=start,eol,indent

"行番号とカーソル行をハイライト(カレントバッファウィンドウだけ)
augroup cursor_line
  autocmd!
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END"

"インデント周り
set et ts=4 sw=4 sts=4
autocmd FileType vim,sh,html,xhtml,javascript,coffee,ruby,eruby,scala,lua setlocal et ts=2 sw=2 sts=2"


""次回はここから！！""
highlight Normal ctermbg=black ctermfg=grey
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
   
" vimのバックアップファイル
set directory=~/tmp/.swap
set backupdir=~/tmp/.~
set undodir=~/tmp/.un~

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

" --- vim-plug ---
call plug#begin('~/.vim/plugged')
""ここに必要なプラグインを書く
Plug 'preservim/nerdtree'
Plug 'tpope/vim-rails'
Plug 'haya14busa/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/neomru.vim'
Plug 'rking/ag.vim'
Plug 'tmhedberg/matchit'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/Align'
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-quickrun'
Plug 'preservim/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/tagbar'
Plug 'slim-template/vim-slim'
call plug#end()

"""""""""Markdown仕様"
au BufRead,BufNewFile *.md set filetype=markdown

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

"""""""""" vim-tags
let g:vim_tags_project_tags_command = "/usr/local/Cellar/ctags/5.8/bin/ctags -f tags -R . 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/Cellar/ctags/5.8/bin/ctags -R -f Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
set tags+=tags,Gemfile.lock.tags
nmap <silent> nn :tjump<CR>
nmap <silent> mm <C-t>

"""""""""" ctrlp.vim
nmap <silent> bb :CtrlP <CR>

"""""""""" neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup() 

" cooperation to Rsense
let g:rsenseUseOmniFunc = 1
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif

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

"""""""""" multi_cursor "
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"""""""""" Quickrun "
nnoremap <silent> <C-q> :QuickRun<CR>
let g:quickrun_config={'*': {'split': 'vertical'}}
set splitright

"""""""""" snippet "
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"""""""""" vim-anzu "
" キーマップ設定
" nmap n <Plug>(anzu-n)
" nmap N <Plug>(anzu-N)
nmap n nzz<Plug>(anzu-update-search-status)
nmap N Nzz<Plug>(anzu-update-search-status)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
" ESC2回押しで検索ハイライトを消去
nmap <silent> <ESC><ESC> :<C-u>nohlsearch<CR><Plug>(anzu-clear-search-status)
" format = (該当数/全体数)
"set statusline=%{anzu#search_status()}
set statusline=%f%m%=%l,%c\ %{'['.(&fenc!=''?&fenc:&enc).']\['.&fileformat.']'}
let g:anzu_status_format = "(%i/%l)"

"""""""""" lightline.vim" (from:http://qiita.com/yuyuchu3333/items/20a0acfe7e0d0e167ccc)
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['fugitive', 'gitgutter', 'filename'],
        \   ],
        \   'right': [
        \     ['lineinfo', 'syntastic'],
        \     ['percent'],
        \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
        \   ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \   'charcode': 'MyCharCode',
        \   'gitgutter': 'MyGitGutter',
        \ },
        \ 'separator': {'left': '⮀', 'right': '⮂'},
        \ 'subseparator': {'left': '⮁', 'right': '⮃'}
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
 return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
       \  &ft == 'unite' ? unite#get_status_string() :
       \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
       \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
    if !  exists('*GitGutterGetHunkSummary')
           \ || ! get(g:, 'gitgutter_enabled', 0)
           \ || winwidth('.') <= 90
      return ''
    endif
    let symbols = [
          \ g:gitgutter_sign_added . ' ',
          \ g:gitgutter_sign_modified . ' ',
          \ g:gitgutter_sign_removed . ' '
          \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
    return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent!
  ascii
    redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'
  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F> 70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction

""""""""""""" vim-gitgutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'
let g:gitgutter_max_signs = 9999

"""""""""""" Rsence
let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec/"

"""""""""""" linter
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_scss_checkers = ['stylelint']
