" vim: set fdm=marker fmr={{{,}}} foldlevel=0:

let g:configDir = $HOME . '/.config/nvim'

" {{{ Plugins
filetype off

function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

call plug#begin(g:configDir.'/plugged')
    source $HOME/.dotfiles/vim/plugins.vimrc
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'w0rp/ale'
call plug#end()
" }}}

" {{{ Plugin Config
" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#deoplete_onmni_patterns = get(g:, 'deoplete#force_omni_input_patterns', {})
let g:deoplete#deoplete_onmni_patterns.javascript = '[^. \t]\.\w*'

" ALE
" let g:ale_history_log_output = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --tab-width 4 --jsx-bracket-same-line --semi false'

" {{{ Settings
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set mouse=a
" }}}

source $HOME/.dotfiles/vim/general.vimrc

" {{{ Keymaps
nnoremap <leader>e :<c-u>Unite -buffer-name=CurrentBufferDirectory -start-insert -auto-resize file_rec/neovim:<c-r>=expand('%:p:h')<cr><cr>
nnoremap <leader>f :FZF<cr>
nnoremap <leader>rc :so  ~/.config/nvim/init.vim<cr>
" }}}
