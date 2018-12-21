" Motions and keys
Plug 'Lokaltog/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/BufOnly.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'majutsushi/tagbar'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Snippets
Plug 'SirVer/ultisnips'

" Files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Search
Plug 'bronson/vim-visual-star-search'

" Javascript
" Plug 'moll/vim-node'
Plug 'ruanyl/vim-sort-imports'

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
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'shinchu/lightline-gruvbox.vim'

" Syntax
Plug 'lifepillar/pgsql.vim'
Plug 'chr4/nginx.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jason0x43/vim-js-indent'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'tomtom/tcomment_vim' " Using this one because it has a bunch of stars and seems actively kept up to date
Plug 'alvan/vim-closetag'
Plug 'elzr/vim-json'
" Plug 'sheerun/vim-polyglot'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
" Plug 'dsimidzija/vim-nerdtree-ignore', { 'on': 'NERDTreeToggle' }

" Colorschemes
Plug 'Yggdroot/indentLine'
" Plug 'ajh17/Spacegray.vim'
" Plug 'flazz/vim-colorschemes'
Plug 'gerw/vim-HiLinkTrace'
Plug 'ryanoasis/vim-devicons'
" Plug 'fneu/breezy'
Plug 'morhetz/gruvbox'
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'sickill/vim-monokai'
" Plug 'bounceme/highwayman'
" Plug 'rafi/awesome-vim-colorschemes'
" Plug 'mhartington/oceanic-next'
" Plug 'cocopon/iceberg.vim'
