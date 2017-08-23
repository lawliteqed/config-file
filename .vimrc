let mapleader = ","
noremap \ ,

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

"let $PATH = "~/.pyenv/shims:".$PATH

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
"let g:acp_enableAtStartup = 1
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#data_directory = $HOME .'/.cache/dein/repos/github.com/Shougo/neocomplete.vim'

let g:neocomplete#delimiter_patterns           = {
\    'javascript': ['.'],
\    'php':        ['->', '::', '\'],
\    'ruby':       ['::']
\}

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#enable_auto_delimiter     = 1
let g:neocomplete#enable_auto_select        = 0
let g:neocomplete#enable_fuzzy_completion   = 0
let g:neocomplete#enable_smart_case         = 1
let g:neocomplete#keyword_patterns          = {'_': '\h\w*'}
let g:neocomplete#lock_buffer_name_pattern  = '\.log\|.*quickrun.*\|.jax'
let g:neocomplete#max_keyword_width         = 30
let g:neocomplete#max_list                  = 8
let g:neocomplete#min_keyword_length        = 3
let g:neocomplete#sources                   = {
\    '_':          ['neosnippet', 'file',               'buffer'],
\    'css':        ['neosnippet',         'dictionary', 'buffer'],
\    'html':       ['neosnippet', 'file', 'dictionary', 'buffer'],
\    'javascript': ['neosnippet', 'file', 'dictionary', 'buffer'],
\    'php':        ['neosnippet', 'file', 'dictionary', 'buffer']
\}

let g:neocomplete#sources#buffer#cache_limit_size  = 50000
let g:neocomplete#sources#buffer#disabled_pattern  = '\.log\|\.jax'
let g:neocomplete#sources#buffer#max_keyword_width = 30

let g:neocomplete#sources#dictionary#dictionaries  = {
\    '_':          '',
\    'css':        $HOME . '/.vim/dict/css.dict',
\    'html':       $HOME . '/.vim/dict/html.dict',
\    'javascript': $HOME . '/.vim/dict/javascript.dict',
\    'php':        $HOME . '/.vim/dict/php.dict'
\}




" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType php,html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

" let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

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
inoremap ;; <C-O>$;<ESC>
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

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
