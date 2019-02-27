
let s:dein_dir = expand('~/.cache/dein') "plugin インストール先
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'  "dein.vim 本体

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let g:rc_dir    = expand('~/.vim/rc')  "プラグインリストを収めた TOML ファイル
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

"未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

set nocompatible
set wildmenu


"omni補完のプレビューを表示しない
set completeopt=menuone


"pyenvは↓でインストール
"env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.7.2
let &pythonthreedll = '/home/ec2-user/.pyenv/versions/3.7.2/lib/libpython3.7m.so.1.0'

filetype plugin on

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_insert_char_pre = 1
let g:neocomplete#enable_smart_case = 0
let g:neocomplete#sources#syntax#min_keyword_length = 2
"let g:neocomplete#data_directory = $HOME .'/.cache/dein/repos/github.com/Shougo/neocomplete.vim'
"let g:neocomplete#delimiter_patterns           = {
"\    'javascript': ['.'],
"\    'php':        ['->', '::', '\'],
"\    'ruby':        ['::']
"\}

let g:neocomplete#enable_complete_select = 1
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#enable_auto_delimiter     = 1
let g:neocomplete#enable_auto_select        = 0
let g:neocomplete#enable_fuzzy_completion   = 0
let g:neocomplete#enable_smart_case         = 1
let g:neocomplete#keyword_patterns          = {'_': '\h\w*'}
let g:neocomplete#lock_buffer_name_pattern  = '\.log\|.*quickrun.*\|.jax'
let g:neocomplete#max_keyword_width         = 20
let g:neocomplete#max_list                  = 10
let g:neocomplete#min_keyword_length        = 2
let g:neocomplete#sources                   = {
\    '_':          ['neosnippet', 'file', 'dictionary', 'buffer'],
\    'css':        ['neosnippet',         'dictionary', 'buffer'],
\    'html':       ['neosnippet', 'file', 'dictionary', 'buffer'],
\    'javascript': ['neosnippet', 'file', 'dictionary', 'buffer'],
\    'php':        ['neosnippet', 'file', 'dictionary', 'buffer'],
\    'yaml.ansible':    ['neosnippet', 'file', 'dictionary', 'buffer'],
\    'python':     ['neosnippet', 'file', 'dictionary', 'buffer', 'omni'],
\    'eruby':       ['neosnippet', 'file', 'dictionary', 'buffer'],
\    'ruby':       ['neosnippet', 'file', 'dictionary', 'buffer']
\}

let g:neocomplete#sources#buffer#cache_limit_size  = 50000
let g:neocomplete#sources#buffer#disabled_pattern  = '\.log\|\.jax'
let g:neocomplete#sources#buffer#max_keyword_width = 20
let g:neocomplete#sources#dictionary#dictionaries  = {
\    '_':          $HOME . '/.vim/dict/common.dict',
\    'css':        $HOME . '/.vim/dict/css.dict',
\    'html':       $HOME . '/.vim/dict/html.dict',
\    'javascript': $HOME . '/.vim/dict/javascript.dict',
\    'php':        $HOME . '/.vim/dict/php.dict',
\    'yaml.ansible':    $HOME . '/.vim/dict/ansible.dict',
\    'python':     $HOME . '/.vim/dict/python_ver3.5.dict',
\    'eruby':       $HOME . '/.vim/dict/ruby.dict',
\    'ruby':       $HOME . '/.vim/dict/ruby.dict'
\}


let g:neosnippet#enable_snipmate_compatibility = 1
"let g:neosnippet#snippets_directory="~/.cache/dein/repos/github.com/honza/vim-snippets/snippets"
let g:neosnippet#snippets_directory= ["~/.cache/dein/repos/github.com/honza/vim-snippets/snippets", "~/.vim/snippets/"]


"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif

inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"



syntax enable
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
set expandtab
set autoindent

set tabstop=4
set shiftwidth=4
set softtabstop=4
set showmatch
set backspace=indent,eol,start

colorscheme monokai
syntax enable
set t_Co=256

"set paste
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
inoremap <silent> jj <ESC>l
inoremap <silent> zh <=
inoremap <silent> zl =>
inoremap <silent> ,, <ESC>la,<ESC>a<SPACE>
inoremap ;; <C-O>$;<ESC>o
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Del>
inoremap <C-h> <BS>

noremap <S-l> $l
noremap <S-h> 0
nnoremap gf <C-w>gf
nnoremap <silent> ss :w<ENTER>

"nnoremap t :tabnew<ENTER>
"nnoremap <S-k> gt
"nnoremap <S-j> gT
"nnoremap <silent> qq :q!<ENTER>


"buffer 
"https://qiita.com/Sa2Knight/items/8a5d3b63dc45b02fc8c9
nnoremap <silent> <S-k> :bnext<CR>
nnoremap <silent> <S-j> :bprev<CR>
nnoremap <silent> qq :bw!<CR>
:set hidden
nnoremap t :e<Space>
nnoremap <silent> ee :q!<ENTER>



nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <Space><Space> :tabnew<ENTER>:e ~/.vimrc<ENTER>

"カーソルを中央に固定。
set scrolloff=1000
"ハイフン付きワードを検索
:set isk+=-
"カーソルを中央に固定。
set scrolloff=1000
"ハイフン付きワードを検索
:set isk+=-

au BufRead,BufNewFile *.yaml set filetype=yaml
autocmd FileType yaml set ts=2 sw=2 sts=2
autocmd FileType json set ts=2 sw=2 sts=2

autocmd FileType python :set dictionary=$HOME/.vim/dict/python.dict
autocmd FileType python set ts=4 sw=4 sts=4
"autocmd BufNewFile,BufRead *.py nnoremap <C-c> :!python % <ENTER>
autocmd BufNewFile,BufRead *.py nnoremap <C-c> :!python % <ENTER>
autocmd BufNewFile,BufRead *.sh nnoremap <C-c> :!bash % <ENTER>

set cursorline


function! CSVH(x)
    execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
    execute 'normal ^'.a:x.'f,'
endfunction
command! -nargs=1 Csvhl :call CSVH(<args>)

nnoremap <F9> :w<CR>:!open %<CR>
