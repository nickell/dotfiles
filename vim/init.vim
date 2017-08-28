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
    " Plug 'marijnh/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
    " Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
    " Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx'] }
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

" let g:deoplete#sources#ternjs#filetypes = [
"                 \ 'jsx',
"                 \ 'javascript.jsx',
"                 \ 'vue',
"                 \ '...'
"                 \ ]

" set completeopt=longest,menuone,preview

" ALE
" let g:ale_history_log_output = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --tab-width 4 --jsx-bracket-same-line --semi false'
" }}}

" {{{ Settings
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set mouse=a
" }}}

source $HOME/.dotfiles/vim/general.vimrc

" {{{ Keymaps
" nnoremap <leader>e :<c-u>Unite -buffer-name=CurrentBufferDirectory -start-insert -auto-resize file_rec/neovim:<c-r>=expand('%:p:h')<cr><cr>
nnoremap <leader>f :FZF<cr>
nnoremap <leader>rc :so  ~/.config/nvim/init.vim<cr>
" }}}
