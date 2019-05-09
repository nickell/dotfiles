let g:configDir = $HOME . '/.config/nvim'

" {{{ Plugins and config
filetype off

call plug#begin(g:configDir.'/plugged')
    source $HOME/.dotfiles/vim/plugins.vimrc
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-ultisnips'
    Plug 'w0rp/ale'
    Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
call plug#end()

source $HOME/.dotfiles/vim/general.vimrc

" nvim-typescript
let g:nvim_typescript#diagnostics_enable=0

" ncm2
augroup ncm
    autocmd!
    autocmd BufEnter * call ncm2#enable_for_buffer()
augroup END
set completeopt=noinsert,menuone,noselect

" ALE
let g:ale_fixers = {}
let g:ale_fixers['sh'] = ['shfmt', 'trim_whitespace']
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 1000
let g:ale_lint_on_text_changed = 'always'
let g:ale_linters = {
    \ 'haskell': ['hlint', 'hdevtools', 'hfmt'],
    \ 'javascript': ['eslint'],
    \ 'typescript': ['eslint', 'tsserver'],
    \}
let g:ale_pattern_options = {
    \ 'node_modules': {'ale_linters': [], 'ale_fixers': []},
    \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
    \}
" \ 'lib': {'ale_linters': [], 'ale_fixers': []},
" }}}

" {{{ Keymaps
nnoremap <leader>rc :so  ~/.config/nvim/init.vim<cr>

" ncm
imap <silent> <c-x><c-o> <Plug>(ncm2_manual_trigger)

" ale
nmap <silent> <leader>j <Plug>(ale_next_wrap)
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
" }}}

" {{{ Hacks
try
  source ~/.vimrc.local
catch
  " No such file? No problem; just ignore it.
endtry
" }}}
