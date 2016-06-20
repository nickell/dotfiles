" vim: set fdm=marker fmr={{{,}}} foldlevel=0:

let g:configDir = $HOME . '/.vim'

" {{{ Plugins
filetype off

call plug#begin(g:configDir.'/plugged')
    source $HOME/.dotfiles/vim/plugins.vimrc
    if has('lua')
        Plug 'Shougo/neocomplete.vim'
    endif
    Plug 'Shougo/vimproc.vim', { 'do': 'make' }
    Plug 'scrooloose/syntastic'
call plug#end()
" }}}

" {{{ Plugin Config
" NeoComplete config
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#sources#buffer#cache_limit_size = 50000
let g:neocomplete#data_directory = $HOME.'/.vim/cache/noecompl'
let g:neocomplete#sources#dictionary#dictionaries = {} " This removes all the fluff from the autocomplete menu
" The next 4 lines are tweaks to make neocomplete play nicely with tern_for_vim
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
" NeoComplete tab completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Syntastic config
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

if executable('ag')
    let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup',  '--hidden', '-g', '']
endif
" }}}

source $HOME/.dotfiles/vim/general.vimrc

" {{{ Keymaps
nnoremap <leader>e :<c-u>Unite -buffer-name=CurrentBufferDirectory -start-insert -auto-resize file_rec/async:<c-r>=expand('%:p:h')<cr><cr>
nnoremap <leader>f :<C-u>Unite -buffer-name=WorkingDirectory -start-insert -auto-resize file_rec/async:.<cr>
nnoremap <leader>rc :so  ~/.vimrc<cr>
" }}}
