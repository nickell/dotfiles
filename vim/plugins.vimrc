" Motions and keys
Plug 'Lokaltog/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/BufOnly.vim'
Plug 'jiangmiao/auto-pairs'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Snippets
Plug 'SirVer/ultisnips'

" Files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Search
Plug 'mileszs/ack.vim'
Plug 'bronson/vim-visual-star-search'

" Javascript
Plug 'moll/vim-node'

" tpope {{{
" :S command, change case (crs, crc, etc.)
Plug 'tpope/vim-abolish'

" Repeat some tpope plugins with .
Plug 'tpope/vim-repeat'

" Use <c-a> <c-x> to increment dates/times
Plug 'tpope/vim-speeddating'

" change surrounding quotes, tags, etc.
Plug 'tpope/vim-surround'

" bracket commands ]<space> for line above, 
Plug 'tpope/vim-unimpaired'

" Vim sugar for unix shell commands :Delete, :Rename, :Move, etc.
Plug 'tpope/vim-eunuch'
" }}}

" Status and tab line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Xolox plugins, :Note, :OpenSession
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes', { 'on': 'Note' }
Plug 'xolox/vim-session'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'tomtom/tcomment_vim' " Using this one because it has a bunch of stars and seems actively kept up to date

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
" Plug 'dsimidzija/vim-nerdtree-ignore', { 'on': 'NERDTreeToggle' }

" Colorschemes
Plug 'Yggdroot/indentLine'
Plug 'flazz/vim-colorschemes'
Plug 'gerw/vim-HiLinkTrace'
Plug 'ryanoasis/vim-devicons'
" Plug 'morhetz/gruvbox'
" Plug 'sickill/vim-monokai'
" Plug 'bounceme/highwayman'
" Plug 'rafi/awesome-vim-colorschemes'
" Plug 'mhartington/oceanic-next'
" Plug 'cocopon/iceberg.vim'
