let mapleader = ","
noremap \ ,

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

"autocmd BufNewFile,BufRead *.rb setfiletype=ruby


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

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion  =  1
" 最初の補完候補を選択状態にする
let g:neocomplcache_enable_auto_select = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2

"バックスペースで補完ポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"


"let g:neocomplete#data_directory = $HOME .'/.cache/dein/repos/github.com/Shougo/neocomplete.vim'
let g:neocomplete#delimiter_patterns           = {
\    'javascript': ['.'],
\    'php':        ['->', '::', '\'],
\    'ruby':       ['::','.']
\}

let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#enable_auto_delimiter     = 1
let g:neocomplete#enable_auto_select        = 0
let g:neocomplete#enable_fuzzy_completion   = 0
let g:neocomplete#enable_smart_case         = 1
"let g:neocomplete#keyword_patterns          = {'_': '\h\w*'}
let g:neocomplete#lock_buffer_name_pattern  = '\.log\|.*quickrun.*\|.jax'
let g:neocomplete#max_keyword_width         = 30
let g:neocomplete#max_list                  = 8
let g:neocomplete#min_keyword_length        = 1
let g:neocomplete#sources                   = {
\    '_':          ['neosnippet', 'file',               'buffer'],
\    'css':        ['neosnippet',         'dictionary', 'buffer'],
\    'html':       ['neosnippet', 'file', 'dictionary', 'buffer'],
\    'javascript': ['neosnippet', 'file', 'dictionary', 'buffer'],
\    'php':        ['neosnippet', 'file', 'dictionary', 'buffer'],
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
\    'ruby':       $HOME . '/.vim/dict/ruby.dict'
\}


if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'

let g:rsenseUseOmniFunc = 1
let g:rsenseHome = expand('/usr/local/rbenv/shims/rsense')

" Enable omni completion.
autocmd FileType html,css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompleteTags
autocmd FileType html,javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType python setlocal omnifunc=jedi#completions

if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'



"------------------------------------
" neosnippet
"------------------------------------

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory="~/.cache/dein/repos/github.com/honza/vim-snippets/snippets/"


inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)



" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

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

autocmd FileType python setlocal completeopt-=preview
let g:jedi#completions_enabled = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#use_tabs_not_buffers = 1 
let g:jedi#popup_select_first = 0 
let g:jedi#popup_on_dot = 1 
let g:jedi#goto_command = "<C-d>"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>R"


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
nnoremap <silent> ss :w<ENTER>
nnoremap <silent> qq :q!<ENTER>
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
nnoremap t :tabnew<ENTER>
nnoremap <S-k> gt
nnoremap <S-j> gT
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <Space><Space> :tabnew<ENTER>:e ~/.vimrc<ENTER>
nnoremap <C-c> :!bash % <ENTER>

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

function! s:scroll_cursor_to_center()
  if line("$") > winheight(0)
    normal! zz
  endif
endfunction

augroup CursorScroll
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:scroll_cursor_to_center()
augroup END

