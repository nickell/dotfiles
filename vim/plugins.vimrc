" Motions and keys
Plug 'Lokaltog/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/BufOnly.vim'
Plug 'jeetsukumaran/vim-indentwise'

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
Plug 'Arkham/vim-quickfixdo'

" Javascript
" Plug 'moll/vim-node'
" Plug 'dgraham/vim-eslint'
Plug 'ruanyl/vim-sort-imports'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

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

" Automatically end vim/bash functions and if statements (and others)
Plug 'tpope/vim-endwise'

" Comment shortcut gcc
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring' " contexts for jsx regions
" }}}

" Status and tab line
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'shinchu/lightline-gruvbox.vim'

" Syntax
Plug 'lifepillar/pgsql.vim'
Plug 'chr4/nginx.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jason0x43/vim-js-indent'
Plug 'tpope/vim-liquid'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pedrohdz/vim-yaml-folds'
" Plug 'tomtom/tcomment_vim' " Using this one because it has a bunch of stars and seems actively kept up to date
Plug 'alvan/vim-closetag'
Plug 'elzr/vim-json'
Plug 'suan/vim-instant-markdown'
Plug 'vim-scripts/changesqlcase.vim'
Plug 'tmux-plugins/vim-tmux'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'sheerun/vim-polyglot'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
" Plug 'dsimidzija/vim-nerdtree-ignore', { 'on': 'NERDTreeToggle' }

" Colorschemes
Plug 'Yggdroot/indentLine'
" Plug 'gertjanreynaert/cobalt2-vim-theme'
" Plug 'ajh17/Spacegray.vim'
" Plug 'flazz/vim-colorschemes'
Plug 'gerw/vim-HiLinkTrace'
Plug 'ryanoasis/vim-devicons'
" Plug 'fneu/breezy'
" Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
" Plug 'mhartington/oceanic-next'
" Plug 'cocopon/iceberg.vim'
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'sickill/vim-monokai'
" Plug 'bounceme/highwayman'
" Plug 'rafi/awesome-vim-colorschemes'
" Plug 'mhartington/oceanic-next'

" Random tools
Plug 'diepm/vim-rest-console'

" IDE
Plug 'w0rp/ale'
