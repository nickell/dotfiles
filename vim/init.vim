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
    Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
call plug#end()

source $HOME/.dotfiles/vim/general.vimrc

" ncm2
augroup ncm
    autocmd!
    autocmd BufEnter * call ncm2#enable_for_buffer()
augroup END
set completeopt=noinsert,menuone,noselect

" nvim-typescript
let g:nvim_typescript#diagnostics_enable=0
" }}}

" {{{ Keymaps
nnoremap <leader>rc :so  ~/.config/nvim/init.vim<cr>

" ncm
imap <silent> <c-x><c-o> <Plug>(ncm2_manual_trigger)
" }}}
