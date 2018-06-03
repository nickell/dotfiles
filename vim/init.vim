let g:configDir = $HOME . '/.config/nvim'

" {{{ Plugins and config
filetype off

call plug#begin(g:configDir.'/plugged')
    source $HOME/.dotfiles/vim/plugins.vimrc
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'w0rp/ale'
    Plug 'wokalski/autocomplete-flow'
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1

" autocomplete-flow
let g:autocomplete_flow#insert_paren_after_function = 0

" ALE
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_linters = {
    \ 'haskell': ['hlint', 'hdevtools', 'hfmt'],
    \ 'javascript': ['eslint', 'flow'],
    \}
" }}}

" {{{ Settings
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set mouse=a
" }}}

source $HOME/.dotfiles/vim/general.vimrc

" {{{ Keymaps
nnoremap <leader>f :FZF<cr>
nnoremap <leader>rc :so  ~/.config/nvim/init.vim<cr>
" }}}
