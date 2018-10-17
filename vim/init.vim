let g:configDir = $HOME . '/.config/nvim'

" {{{ Plugins and config
filetype off

call plug#begin(g:configDir.'/plugged')
    source $HOME/.dotfiles/vim/plugins.vimrc
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'w0rp/ale'
    " Plug 'wokalski/autocomplete-flow'
    Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
call plug#end()

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\ 'auto_complete_delay': 20,
\ 'min_pattern_length': 2,
\ 'ignore_sources': {
    \ 'typescript': ['buffer'],
    \}
\ })


" autocomplete-flow
let g:autocomplete_flow#insert_paren_after_function = 0

" ALE
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['sh'] = ['shfmt', 'trim_whitespace']
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 100
" let g:ale_lint_on_text_changed = 'normal'
let g:ale_linters_ignore = {'typescript': ['tslint', 'eslint', 'typecheck']}
let g:ale_linters = {
    \ 'haskell': ['hlint', 'hdevtools', 'hfmt'],
    \ 'javascript': ['eslint', 'flow'],
    \}
let g:ale_pattern_options = {
    \ 'node_modules': {'ale_linters': [], 'ale_fixers': []},
    \ 'lib': {'ale_linters': [], 'ale_fixers': []},
    \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
    \}
" }}}

" {{{ Settings
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set mouse=a
" }}}

source $HOME/.dotfiles/vim/general.vimrc

" {{{ Keymaps
nnoremap <leader>f :Files<cr>
nnoremap <leader>rc :so  ~/.config/nvim/init.vim<cr>
" }}}

try
  source ~/.vimrc.local
catch
  " No such file? No problem; just ignore it.
endtry
