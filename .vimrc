" vim: set fdm=marker fmr={{{,}}}:

" {{{ NeoBundle Config
    if has("vim_starting")
      set nocompatible
      " Required:
      set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif

    " Required:
    call neobundle#begin(expand("~/.vim/bundle/"))

    " Let NeoBundle manage NeoBundle
    " Required:
    NeoBundleFetch "Shougo/neobundle.vim"

    NeoBundle "Shougo/vimproc", {
          \ "build" : {
          \     "windows" : "make -f make_mingw32.mak",
          \     "cygwin" : "make -f make_cygwin.mak",
          \     "mac" : "make -f make_mac.mak",
          \     "unix" : "make -f make_unix.mak",
          \    },
          \ }

    NeoBundle "tpope/vim-abolish"
    NeoBundle "tpope/vim-sensible"
    NeoBundle "scrooloose/syntastic"
    NeoBundle "Shougo/neocomplete.vim"
    NeoBundle "Shougo/unite.vim"
    NeoBundle "Shougo/context_filetype.vim"
    NeoBundle "Lokaltog/vim-easymotion"
    NeoBundle "marijnh/tern_for_vim"

    " Syntax definitions
    NeoBundle "elzr/vim-json"
    NeoBundle "pangloss/vim-javascript"
    NeoBundle "jelera/vim-javascript-syntax", {"autoload":{"filetypes":["javascript"]}}
    NeoBundle "hail2u/vim-css3-syntax"
    NeoBundle "othree/html5.vim"
    NeoBundle "StanAngeloff/php.vim"

    " Themes
    NeoBundle "sickill/vim-monokai"
    " NeoBundle "trusktr/seti.vim"

    call neobundle#end()

    " Auto Install Bundles
    NeoBundleCheck

" }}}

"--------------------------------------------------------------------------------
"-- Syntax
"--------------------------------------------------------------------------------
filetype plugin indent on
syntax enable
set foldlevel=0
set foldnestmax=1
set foldmethod=syntax

"--------------------------------------------------------------------------------
"-- Theme
"--------------------------------------------------------------------------------
set background=dark
colorscheme monokai
set guifont=Inconsolata:h16
highlight Search cterm=reverse

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
nnoremap <leader>n :tabe<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader><cr> :noh<cr>

" Unite mappings
nnoremap <leader>f :Unite -buffer-name=files -start-insert -auto-resize buffer file_rec/async<cr>
nnoremap <C-P> :Unite -buffer-name=files -start-insert -auto-resize file_rec/async<cr>
nnoremap <leader>g :Unite -silent grep:%:<cr>
nnoremap <leader>l :Unite line<cr>
nnoremap <leader>b :Unite -auto-resize buffer<cr>

" Easymotion mappings
nmap s <Plug>(easymotion-s)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

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

" Keep buffers in memory
set hidden

" Use mouse to move cursor
set mouse=a

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Comment at top of file to configure vim
set modeline

" Relative line numbers
set number
set relativenumber

" Search tweaks
set ignorecase
set hlsearch

" Autocmds 
augroup mygroup
    autocmd!
    " Git tweaks
    autocmd Filetype gitcommit setlocal spell textwidth=72 
    " Search highlighting tweaks
    autocmd InsertEnter * :set nohlsearch
    autocmd InsertLeave * :set hlsearch
    " Enable javascript folding with the jelera javascript plugin
    " autocmd FileType javascript call JavaScriptFold()
    " These next two prevent all the folds from opening beneath the cursor
    " during edits
    autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
augroup END

" This is a fix to stop vim from saving twice - it was messing up gulp watch
set nowritebackup

" {{{ Plugin Config
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#sources#buffer#cache_limit_size = 50000
let g:neocomplete#data_directory = $HOME.'/.vim/cache/noecompl'
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#sources#dictionary#dictionaries = {}
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
let g:neocomplete#enable_auto_close_preview = 1
set completeopt-=preview
 
"let g:neocomplete#min_keyword_length = 3
"let g:neocomplete#auto_completion_start_length=4
"let g:neocomplete#enable_fuzzy_completion=0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_javascript_jshint_exec='/user/local/bin/jshint'

let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --ignore "node_modules" --hidden -g ""'
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--smart-case --line-numbers --nocolor --nogroup'
"let g:unite_source_grep_recursive_opt = ''

" Easymotion config
let g:EasyMotion_smartcase = 1

" NeoComplete tab completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
" }}}
