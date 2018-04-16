" vim: set fdm=marker fmr={{{,}}} foldlevel=0:

let g:configDir = $HOME . '/.vim'

" {{{ Plugins
filetype off

function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

call plug#begin(g:configDir.'/plugged')
    source $HOME/.dotfiles/vim/plugins.vimrc
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'w0rp/ale'
    Plug 'wokalski/autocomplete-flow'
    " Plug 'marijnh/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
    " Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
    " Plug 'flowtype/vim-flow' Plugin unmaintained :(
call plug#end()
" }}}

" {{{ Plugin Config
" tern_for_vim
" let g:tern#command = ["tern"]
" let g:tern#arguments = ["--persistent"]

" Deoplete
" let g:deoplete#omni#functions = {}
" let g:deoplete#omni#functions.javascript = [
"   \ 'tern#Complete',
" \]

" Test
" let test#strategy = "neovim"

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 0
" let g:deoplete#deoplete_onmni_patterns = get(g:, 'deoplete#force_omni_input_patterns', {})
" let g:deoplete#onmni_patterns = {}
" let g:deoplete#onmni_patterns.javascript = '[^. \t]\.\w*'
" let g:deoplete#sources = {}
" let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
" let g:deoplete#sources['javascript'] = ['file', 'ultisnips', 'ternjs']
" let g:deoplete#sources#ternjs#timeout = 1
" let g:deoplete#sources#ternjs#types = 0
" let g:deoplete#sources#ternjs#depths = 0
" let g:deoplete#sources#ternjs#filter = 1
" let g:deoplete#sources#ternjs#case_insensitive = 1
" let g:deoplete#sources#ternjs#guess = 0
" let g:deoplete#sources#ternjs#sort = 0
" let g:deoplete#sources#ternjs#expand_word_forward = 0
" let g:deoplete#sources#ternjs#omit_object_prototype = 0
" let g:deoplete#sources#ternjs#include_keywords = 1
" let g:deoplete#sources#ternjs#in_literal = 0

" vim-flow
" let g:flow#enable = 0
" let g:flow#omnifunc = 0
" let g:flow#autoclose = 1

" let g:deoplete#sources#ternjs#filetypes = [
"                 \ 'jsx',
"                 \ 'javascript.jsx',
"                 \ 'vue',
"                 \ '...'
"                 \ ]

" set completeopt=longest,menuone,preview

" autocomplete-flow
let g:autocomplete_flow#insert_paren_after_function = 0

" ALE
" let g:ale_history_log_output = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fix_on_save = 1
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --tab-width 2 --jsx-bracket-same-line --no-semi'
" let g:ale_javascript_prettier_use_local_config = 1
let g:ale_linters = {
    \ 'haskell': ['hlint', 'hdevtools', 'hfmt'],
    \ 'javascript': ['eslint', 'flow'],
    \ 'typescript': ['tslint']
    \}
" }}}

" {{{ Settings
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set mouse=a
" }}}

source $HOME/.dotfiles/vim/general.vimrc

" {{{ Keymaps
" nnoremap <leader>e :<c-u>Unite -buffer-name=CurrentBufferDirectory -start-insert -auto-resize file_rec/neovim:<c-r>=expand('%:p:h')<cr><cr>
nnoremap <leader>f :FZF<cr>
nnoremap <leader>rc :so  ~/.vimrc<cr>
" }}}








" vim: set fdm=marker fmr={{{,}}} foldlevel=0:

" let g:configDir = $HOME . '/.vim'
"
" " {{{ Plugins
" filetype off
"
" call plug#begin(g:configDir.'/plugged')
"     source $HOME/.dotfiles/vim/plugins.vimrc
"     if has('lua')
"         Plug 'Shougo/neocomplete.vim'
"     endif
"     Plug 'Shougo/vimproc.vim', { 'do': 'make' }
"     Plug 'scrooloose/syntastic'
" call plug#end()
" " }}}
"
" " {{{ Plugin Config
" " NeoComplete config
" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_auto_close_preview = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 2
" let g:neocomplete#auto_completion_start_length = 2
" let g:neocomplete#sources#buffer#cache_limit_size = 50000
" let g:neocomplete#data_directory = $HOME.'/.vim/cache/noecompl'
" let g:neocomplete#sources#dictionary#dictionaries = {} " This removes all the fluff from the autocomplete menu
" " The next 4 lines are tweaks to make neocomplete play nicely with tern_for_vim
" if !exists('g:neocomplete#force_omni_input_patterns')
"     let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
" " NeoComplete tab completion
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"
" " Syntastic config
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 2
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" let syntastic_mode_map = { 'passive_filetypes': ['html'] }
"
" if executable('ag')
"     let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup',  '--hidden', '-g', '']
" endif
" " }}}
"
" source $HOME/.dotfiles/vim/general.vimrc
"
" " {{{ Keymaps
" " nnoremap <leader>e :<c-u>Unite -buffer-name=CurrentBufferDirectory -start-insert -auto-resize file_rec/async:<c-r>=expand('%:p:h')<cr><cr>
" nnoremap <leader>f :<C-u>Unite -buffer-name=WorkingDirectory -start-insert -auto-resize file_rec/async:.<cr>
" nnoremap <leader>rc :so  ~/.vimrc<cr>
" " }}}
