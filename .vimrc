" vim: set fdm=marker fmr={{{,}}}:

" {{{ NeoBundle
" This is a check to make sure python plugins play nice with neovim
if has('nvim')
    runtime! plugin/python_setup.vim
endif

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
NeoBundle "Shougo/neosnippet.vim"
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle "Lokaltog/vim-easymotion"
NeoBundle "marijnh/tern_for_vim"
NeoBundle "tpope/vim-obsession"

" Syntax
NeoBundle "elzr/vim-json"
NeoBundle "pangloss/vim-javascript"
NeoBundle "hail2u/vim-css3-syntax"
NeoBundle "othree/html5.vim"
NeoBundle "StanAngeloff/php.vim"
NeoBundle "tpope/vim-commentary"
NeoBundle "plasticboy/vim-markdown"
NeoBundle "suan/vim-instant-markdown"
NeoBundle "tpope/vim-surround"

" Themes
" NeoBundle "sickill/vim-monokai"
NeoBundle "altercation/vim-colors-solarized"
NeoBundle "itchyny/lightline.vim"
" NeoBundle "john2x/flatui.vim"
" NeoBundle "trusktr/seti.vim"

call neobundle#end()
NeoBundleCheck
" }}}

" {{{ Autocmds 
augroup mygroup
    autocmd!
    " Git tweaks
    autocmd Filetype gitcommit setlocal textwidth=72 
    " Search highlighting tweaks
    autocmd InsertEnter * :set nohlsearch
    autocmd InsertLeave * :set hlsearch
    " These next two prevent all the folds from opening beneath the cursor during edits
    autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
    " This forces tabs in a makefile
    autocmd filetype make setlocal noexpandtab
    " Make text files do soft wrappping
    autocmd BufRead,BufNewFile *.txt set wrap linebreak nolist textwidth=0 wrapmargin=0
augroup END
" }}}

" {{{ Plugin Config
" NeoComplete config
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#sources#buffer#cache_limit_size = 50000
let g:neocomplete#data_directory = $HOME.'/.vim/cache/noecompl'
let g:neocomplete#sources#dictionary#dictionaries = {} " This removes all the fluff from the autocomplete menu
set completeopt-=preview " I'm not positive what this does but it's crucial I think
" The next 4 lines are tweaks to make neocomplete play nicely with tern_for_vim
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
" NeoComplete tab completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" NeoSnippet config
let g:neosnippet#snippets_directory='~/.vim/snippets'

" Powerline config
" source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
" Lightline config
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
let g:lightline = {
    \ 'colorscheme': 'solarized_dark',
    \ 'component': {
    \   'readonly': '%{&readonly?"":""}',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }

" Syntastic config
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" Unite config
let g:unite_source_history_yank_enable = 1
let g:unite_source_grep_max_candidates = 200
if executable('ag')
    let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --ignore "(node_modules)" --ignore "*.cache*" --hidden -g ""'
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --line-numbers --smart-case --nocolor --nogroup --hidden --ignore ' .
                \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
endif

" Easymotion config
let g:EasyMotion_smartcase = 1
" }}}

" {{{ Syntax
filetype plugin indent on
syntax enable
set foldlevel=0
set foldnestmax=1
set foldmethod=syntax

" Tabs config
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Relative line numbers
set number
set relativenumber
" }}}

" {{{ Theme
set background=dark
colorscheme solarized
hi Folded ctermbg=none
set guifont=Inconsolata\ for\ Powerline:h12
" }}}

" {{{ Key Bindings
let mapleader = ","
inoremap jk <ESC>
nnoremap <space> /
nnoremap ; :
nnoremap 0 ^
nnoremap <leader>w :w!<cr>
nnoremap <leader>t :tabedit <c-r>=expand("%:p:h")<cr>/
nnoremap <leader>1 :tabp<return>
nnoremap <leader>2 :tabn<return>
nnoremap <leader>3 :tabm -1<return>
nnoremap <leader>4 :tabm +1<return>
nnoremap <leader>0 :e ~/.vimrc
nnoremap <leader>9 :e ~/.bin/functions.zsh
nnoremap <leader>n :tabe<cr>
nnoremap <leader><cr> :noh<cr>
nnoremap <leader>s :source ~/.vimrc<cr>

" Make paste audo indent correctly
nnoremap p p=`]

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv


" Unite mappings
nnoremap <leader>f :Unite -buffer-name=WorkingDirectory -start-insert -auto-resize buffer file_rec/async:.<cr>
nnoremap <leader>ug :Unite -silent grep:.:<cr>
nnoremap <leader>ul :Unite line<cr>
nnoremap <leader>b :Unite -auto-resize buffer<cr>
nnoremap <leader>uh :Unite -auto-resize file_rec/async:~<cr>
nnoremap <leader>e :Unite -buffer-name=CurrentBufferDirectory -start-insert -auto-resize file_rec/async:<c-r>=expand('%:p:h')<cr><cr>
nnoremap <leader>y :<C-u>Unite history/yank<CR>

" Easymotion mappings
nmap s <Plug>(easymotion-s)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

" NeoSnippet mappings
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" }}}

" {{{ Miscellaneous
set nowrap
set splitbelow
set splitright
set clipboard=unnamed

" Do not store global and local values in a session
set ssop-=options

" Keep buffers in memory
set hidden

" Use mouse to move cursor
set mouse=a

" Comment at top of file to configure vim
set modeline

" Search tweaks
set ignorecase
set hlsearch

" This is a fix to stop vim from saving twice - it was messing up gulp watch
set nowritebackup

" This configures the ignore pattern for some plugins, I don't think I'm even
" using anything that is affected by this
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" }}}
