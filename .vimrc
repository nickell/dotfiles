" vim: set fdm=marker fmr={{{,}}}:

" {{{ NeoBundle Config
    if has('vim_starting')
      set nocompatible               " Be iMproved
      " Required:
      set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif

    " Required:
    call neobundle#begin(expand('~/.vim/bundle/'))

    " Let NeoBundle manage NeoBundle
    " Required:
    NeoBundleFetch 'Shougo/neobundle.vim'

    NeoBundle 'Shougo/vimproc', {
          \ 'build' : {
          \     'windows' : 'make -f make_mingw32.mak',
          \     'cygwin' : 'make -f make_cygwin.mak',
          \     'mac' : 'make -f make_mac.mak',
          \     'unix' : 'make -f make_unix.mak',
          \    },
          \ }

    "NeoBundle 'Shougo/unite.vim'
    "NeoBundle 'tpope/vim-surround'
    NeoBundle 'tpope/vim-abolish'
    NeoBundle 'scrooloose/syntastic'
    "NeoBundle 'Lokaltog/vim-easymotion'
    NeoBundle 'kien/ctrlp.vim'
    NeoBundle 'Shougo/neocomplete.vim'
    NeoBundle 'joonty/vdebug'
    NeoBundle 'digitaltoad/vim-jade'
    NeoBundle 'tpope/vim-git'

    " Syntax definitions
    "NeoBundle 'groenewege/vim-less'
    NeoBundle "elzr/vim-json"
    "NeoBundle 'tpope/vim-markdown'
    NeoBundle "pangloss/vim-javascript"
    NeoBundle "hail2u/vim-css3-syntax"
    NeoBundle "othree/html5.vim"
    "NeoBundle 'toyamarinyon/vim-swift'
    NeoBundle 'StanAngeloff/php.vim'

    " Markdown
    "NeoBundle 'suan/vim-instant-markdown'

    "NeoBundle 'altercation/vim-colors-solarized'
   NeoBundle 'sickill/vim-monokai'

    call neobundle#end()

    " Auto Install Bundles
    NeoBundleCheck

" }}}

"--------------------------------------------------------------------------------
"-- Syntax
"--------------------------------------------------------------------------------
filetype plugin indent on
syntax enable
let php_folding = 1        "Set PHP folding of classes and functions.
let php_htmlInStrings = 1  "Syntax highlight HTML code inside PHP strings.
let php_sql_query = 1      "Syntax highlight SQL code inside PHP strings.
let php_noShortTags = 1    "Disable PHP short tags.
set foldlevel=0
set foldnestmax=1

"--------------------------------------------------------------------------------
"-- Theme
"--------------------------------------------------------------------------------
set background=dark
colorscheme monokai
set guifont=Inconsolata:h16

"--------------------------------------------------------------------------------
"-- Key Bindings
"--------------------------------------------------------------------------------
let mapleader = ","
inoremap jk <ESC>
nnoremap <space> /
nnoremap ; :
nnoremap 0 ^
nnoremap <leader>w :w!<cr>
nnoremap <leader>ls :source ~/Session.vim
nnoremap <leader>ms :mksession! ~/Session.vim
nnoremap <leader>t :tabedit <c-r>=expand("%:p:h")<cr>/
nnoremap <leader>1 :tabp<return>
nnoremap <leader>2 :tabn<return>
nnoremap <leader>3 :tabm -1<return>
nnoremap <leader>4 :tabm +1<return>
nnoremap <leader>e :VimFiler<cr>
nnoremap <leader>v :vsp<cr>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <leader>n :tabe<cr>
nnoremap <leader>c :NeoCompleteToggle<cr>

"--------------------------------------------------------------------------------
"-- Tabs config
"--------------------------------------------------------------------------------
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

"--------------------------------------------------------------------------------
"-- Miscellaneous
"--------------------------------------------------------------------------------
set nowrap
set splitbelow
set splitright
set clipboard=unnamed

"call vimfiler#custom#profile('default', 'context', {
"    \ 'safe' : 0,
"    \ })

" Use mouse to move cursor
set mouse=a

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Comment at top of file to configure vim
set modeline

set number
set relativenumber

" Ignore upper/lower case in searches
set ignorecase

" Backspace will delete a newline character
set backspace=2

" Git tweaks
autocmd Filetype gitcommit setlocal spell textwidth=72

" This is a fix to stop vim from saving twice - it was messing up gulp watch
set nowritebackup

"--------------------------------------------------------------------------------
"-- Plugin config
"--------------------------------------------------------------------------------
"let g:syntastic_html_tidy_ignore_errors=["proprietary attribute", "trimming empty", "discarding unexpected <html>", "<form> lacks \"action\" attribute"]
"let syntastic_mode_map = { 'passive_filetypes':['html'] }
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#min_keyword_length = 3
let g:neocomplete#auto_completion_start_length=4
let g:neocomplete#enable_fuzzy_completion=0

" NeoComplete tab completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

let g:vdebug_options= {
    \    "port" : 9000,
    \    "server" : 'localhost',
    \    "timeout" : 20,
    \    "on_close" : 'detach',
    \    "break_on_open" : 0,
    \    "ide_key" : 'vim-xdebug',
    \    "path_maps" : {},
    \    "debug_window_level" : 0,
    \    "debug_file_level" : 0,
    \    "debug_file" : "",
    \    "watch_window_style" : 'expanded',
    \    "marker_default" : '⬦',
    \    "marker_closed_tree" : '▸',
    \    "marker_open_tree" : '▾'
    \}


"autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
"autocmd  FileType  html setlocal omnifunc=htmlcomplete#CompleteTags
