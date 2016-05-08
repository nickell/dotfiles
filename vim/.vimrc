" vim: set fdm=marker fmr={{{,}}} foldlevel=0:

let g:vimDir = $HOME . '/.vim'

" {{{ Plugins
filetype off

call plug#begin(g:vimDir.'/plugged')
    source $HOME/.dotfiles/vim/plugins.vimrc
    Plug 'Shougo/neocomplete.vim'
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
set completeopt-=preview " I'm not positive what this does but it's crucial I think
" The next 4 lines are tweaks to make neocomplete play nicely with tern_for_vim
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
" NeoComplete tab completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" }}}

" {{{ Keymaps
nnoremap <leader>r :so  ~/.vimrc<cr>
" }}}

source $HOME/.dotfiles/vim/general.vimrc
