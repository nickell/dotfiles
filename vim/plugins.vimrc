Plug 'Lokaltog/vim-easymotion'
Plug 'janko-m/vim-test'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'danro/rename.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'henrik/vim-indexed-search' " At match x of y matches
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'kshenoy/vim-signature' " Show marks in the gutter
" Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'moll/vim-node'
" Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'bronson/vim-visual-star-search'
" Plug 'svermeulen/vim-easyclip'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/BufOnly.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes', { 'on': 'Note' }
Plug 'xolox/vim-session'

" Folds
" Plug 'Konfekt/FastFold'
" Plug 'kopischke/vim-stay' " Save folds
" Plug 't9md/vim-foldtext' " Customize fold text

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'alx741/vim-hindent'
Plug 'fleischie/vim-styled-components'
" Using tcomment here because it can handle embedded jsx within js files
" Plug 'vim-scripts/tComment'
" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim' " Using this one because it has a bunch of stars and seems actively kept up to date

" NERDTree
Plug 'scrooloose/nerdtree' ", { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'dsimidzija/vim-nerdtree-ignore', { 'on': 'NERDTreeToggle' }

" Colorschemes
" Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
" Plug 'bounceme/highwayman'

" This function is for euclio/vim-markdown-composer
" Instructions for installing rust: https://github.com/euclio/vim-markdown-composer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
