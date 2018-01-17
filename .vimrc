let mapleader = ","
noremap \ ,

au BufRead,BufNewFile *.rb set filetype=ruby
au BufRead,BufNewFile *.erb set filetype=ruby

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif


" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif


autocmd FileType python setlocal completeopt-=preview

"----------------------------------------------------------
" neocomplete・neosnippetの設定
"----------------------------------------------------------

"バックスペースで補完ポップアップを閉じる
"inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

"最初の候補が選ばれてしまうのを無理やり防ぐ-issues26
"let g:neocomplete#enable_refresh_always = 1

"set completeopt-=noselect
"set completeopt+=noinsert

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_insert_char_pre = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

let g:neocomplete#data_directory = $HOME .'/.cache/dein/repos/github.com/Shougo/neocomplete.vim'
let g:neocomplete#delimiter_patterns           = {
\    'javascript': ['.'],
\    'php':        ['->', '::', '\'],
\    'ruby':        ['::']
\}

let g:neocomplete#enable_complete_select = 1


let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#enable_auto_delimiter     = 1
let g:neocomplete#enable_auto_select        = 0
let g:neocomplete#enable_fuzzy_completion   = 0
let g:neocomplete#enable_smart_case         = 1
let g:neocomplete#keyword_patterns          = {'_': '\h\w*'}
let g:neocomplete#lock_buffer_name_pattern  = '\.log\|.*quickrun.*\|.jax'
let g:neocomplete#max_keyword_width         = 30
let g:neocomplete#max_list                  = 15
let g:neocomplete#min_keyword_length        = 3

let g:neocomplete#sources                   = {
\    '_':          ['neosnippet', 'file',               'buffer'],
\    'css':        ['neosnippet',         'dictionary', 'buffer'],
\    'html':       ['neosnippet', 'file', 'dictionary', 'buffer'],
\    'javascript': ['neosnippet', 'file', 'dictionary', 'buffer'],
\    'php':        ['neosnippet', 'file', 'dictionary', 'buffer'],
\    'ansible':    ['neosnippet', 'file', 'dictionary', 'buffer'],
\    'ruby':       ['neosnippet', 'file', 'dictionary', 'buffer']
\}

let g:neocomplete#sources#buffer#cache_limit_size  = 50000
let g:neocomplete#sources#buffer#disabled_pattern  = '\.log\|\.jax'
let g:neocomplete#sources#buffer#max_keyword_width = 30

let g:neocomplete#sources#dictionary#dictionaries  = {
\    'css':        $HOME . '/.vim/dict/css.dict',
\    'html':       $HOME . '/.vim/dict/html.dict',
\    'javascript': $HOME . '/.vim/dict/javascript.dict',
\    'php':        $HOME . '/.vim/dict/php.dict',
\    'ansible':    $HOME . '/.vim/dict/ansible.dict',
\    'ruby':       $HOME . '/.vim/dict/ruby.dict'
\}

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" Enable omni completion.
autocmd FileType html,css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompleteTags
autocmd FileType html,javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:rubycomplete_rails = 1
"let g:rubycomplete_buffer_loading = 1
"let g:rubycomplete_classes_in_global = 1
"let g:rubycomplete_include_object = 1
"let g:rubycomplete_include_object_space = 1

if has("autocmd")
    autocmd FileType ruby set omnifunc=rubycomplete#Complete
    autocmd FileType ruby let g:rubycomplete_buffer_loading=1
    autocmd FileType ruby let g:rubycomplete_classes_in_global=0
    autocmd FileType ruby let g:rubycomplete_include_object=1
    autocmd FileType ruby let g:rubycomplete_include_object_space=1
endif


if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.python = ''
let g:neocomplete#sources#omni#input_patterns.ruby = ''

if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'


"rsenseのインストールフォルダがデフォルトと異なるので設定
let g:rsenseHome = expand("/usr/local/rbenv/shims/rsense")
let g:rsenseUseOmniFunc = 1

" unite-ruby-require
let g:unite_source_ruby_require_ruby_command = expand("/usr/local/rbenv/shims/ruby")


"------------------------------------
" neosnippet
"------------------------------------

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory="~/.cache/dein/repos/github.com/honza/vim-snippets/snippets"

inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"



" For conceal markers.
if has('conceal')
 set conceallevel=2 concealcursor=i
endif


"------------------------------------
" supertab
"------------------------------------
"let g:SuperTabContextDefaultCompletionType = "context"
"let g:SuperTabDefaultCompletionType = "<c-n>"

"------------------------------------
" NERDTree https://kamiya555.github.io/2015/10/14/nerdtree-command/
"------------------------------------
augroup myvimrc
    autocmd!
augroup END
autocmd myvimrc filetype nerdtree nnoremap <buffer> <S-k> gt
autocmd myvimrc filetype nerdtree nnoremap <buffer> <S-j> gT
map <C-e> :NERDTreeToggle<CR>


"filetype on
syntax enable

" 見た目系
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
set expandtab
set autoindent

highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

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
inoremap <silent> ,, <ESC>la,<ESC>a<SPACE>
inoremap ;; <C-O>$;<ESC>o
nnoremap <S-l> $l
nnoremap <S-h> 0
nnoremap gf <C-w>gf
nnoremap <silent> ss :w<ENTER>
nnoremap <silent> qq :q!<ENTER>
"nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
nnoremap t :tabnew<ENTER>
nnoremap <S-k> gt
nnoremap <S-j> gT
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <Space><Space> :tabnew<ENTER>:e ~/.vimrc<ENTER>
autocmd BufNewFile,BufRead *.py nnoremap <C-c> :!python %<ENTER>
autocmd BufNewFile,BufRead *.rb nnoremap <C-c> :!ruby % s3<ENTER>
autocmd BufNewFile,BufRead *.sh nnoremap <C-c> :!bash % sakai-zabbix<ENTER>

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END


"カーソルを中央に固定。
set scrolloff=1000


au BufRead,BufNewFile *.yml set filetype=ansible

autocmd FileType ansible set ts=2 sw=2 sts=2
let g:ansible_unindent_after_newline = 1
let g:ansible_extra_syntaxes = "monokai.vim"
let g:ansible_attribute_highlight = "ob"
let g:ansible_extra_keywords_highlight = 1

call neocomplete#custom#source('file', 'rank', 10)
