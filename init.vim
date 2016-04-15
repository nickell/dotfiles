" vim: set fdm=marker fmr={{{,}}}:

" {{{ Plugins
" not a vi
set encoding=utf-8

" start vundler
filetype off

call plug#begin('~/.config/nvim/plugged')
    " core plugins
    " Plug 'flazz/vim-colorschemes'
    Plug 'morhetz/gruvbox'
    Plug 'Shougo/unite.vim'

    " vim main plugins
    Plug 'vim-airline/vim-airline'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-scripts/tComment'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'mileszs/ack.vim'
    Plug 'rking/ag.vim'
    Plug 'edsono/vim-matchit'
    Plug 'tpope/vim-fugitive'
    Plug 'henrik/vim-indexed-search'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-repeat'
    Plug 'xolox/vim-session'
    Plug 'xolox/vim-misc'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'Lokaltog/vim-easymotion'
    Plug 'rhysd/clever-f.vim'
    Plug 'qpkorr/vim-bufkill'
    Plug 'vim-scripts/BufOnly.vim'
    " Plug 'scrooloose/syntastic'

    " togglable panels
    Plug 'tpope/vim-vinegar'

    " language vundles
    Plug 'sheerun/vim-polyglot'
    Plug 'marijnh/tern_for_vim'
    " Plug 'plasticboy/vim-markdown'
    
    " Various javascript plugins
    " Plug 'gavocanov/vim-js-indent'
    " Plug 'pangloss/vim-javascript'
    " Plug 'mxw/vim-jsx'
    " Plug 'jelera/vim-javascript-syntax'
    " Plug 'othree/yajs'
    " Plug 'othree/javascript-libraries-syntax.vim'
    " Plug 'othree/es.next.syntax.vim'

    " autocomplete
    Plug 'Shougo/deoplete.nvim'
    Plug 'benekastah/neomake'
call plug#end()

" enable all the plugins
filetype plugin indent on
" }}}

" {{{ Settings
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set ruler
set hidden
set ignorecase
set smartcase
set showmatch
set incsearch
set hls
set number
set relativenumber
set ls=2
set nowrap
set backspace=indent,eol,start
set shell=/bin/bash
set completeopt -=preview
set textwidth=100
set wildmenu
set wildignorecase
set noshowmode
set cmdheight=1
set foldmethod=syntax
set foldnestmax=1
set foldlevelstart=99

" backup/persistance settings
set undodir=~/.config/nvim/undo//
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

" persist (g)undo tree between sessions
set undofile
set history=100
set undolevels=100

syntax on
set background=dark
colorscheme gruvbox

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "yes"
let g:session_autosave = "yes"
let g:session_default_to_last = 1
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession 
nnoremap <leader>ss :SaveSession 
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" NERDTree
let g:NERDTreeWinSize = 24
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore=['node_modules$[[dir]]']
" }}}

" {{{ Key Bindings
let mapleader = " "
inoremap jk <ESC>
" nnoremap , za
nnoremap ; :
nnoremap 0 ^
nnoremap <leader>w :w!<cr>
" nnoremap <leader>t :tabedit <c-r>=expand("%:p:h")<cr>/
nnoremap <leader>1 :tabp<return>
nnoremap <leader>2 :tabn<return>
nnoremap <leader>3 :tabm -1<return>
nnoremap <leader>4 :tabm +1<return>
nnoremap <leader>n :tabe<cr>
nnoremap <leader><cr> :noh<cr>
cmap w!! w !sudo tee > /dev/null %
tnoremap <Leader>e <C-\><C-n>:bp<cr>
tnoremap jk <C-\><C-n>
nnoremap gp :bp<cr>
nnoremap gn :bn<cr>
nnoremap gd :BD<cr>

" tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap ˙ <C-w>h
nnoremap ∆ <C-w>j
nnoremap ˚ <C-w>k
nnoremap ¬ <C-w>l

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Unite mappings
nnoremap <leader>f :<C-u>Unite -buffer-name=WorkingDirectory -start-insert -auto-resize file_rec/neovim:.<cr>
nnoremap <leader>ug :<C-u>Unite -silent grep:.:<cr>
nnoremap <leader>ul :<C-u>Unite line<cr>
nnoremap <leader>bu :<C-u>Unite -auto-resize -start-insert buffer<cr>
nnoremap <leader>uh :<C-u>Unite -auto-resize file_rec/async:~<cr>
nnoremap <leader>e :<C-u>Unite -buffer-name=CurrentBufferDirectory -start-insert -auto-resize file_rec/async:<c-r>=expand('%:p:h')<cr><cr>

nnoremap <leader>y :<C-u>Unite history/yank<CR>
nnoremap <leader>ur <Plug>(unite_redraw)

" Easymotion mappings
nmap s <Plug>(easymotion-s)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

nnoremap <leader>so :OpenSession 
nnoremap <leader>ss :SaveSession 
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>
" nnoremap gp `[v`]

"make enter break and do newlines
nnoremap <CR> i<CR><Esc>==

" open vimrc
nnoremap <leader>v :e  ~/.config/nvim/init.vim<CR>

" reload all open buffers
nnoremap <leader>Ra :tabdo exec "windo e!"

" Keep search matches in the middle of the window.
"   nnoremap n nzzzv
"   nnoremap N Nzzzv

" Use sane regexes
nnoremap <leader>/ /\v
vnoremap <leader>/ /\v

" Use :Subvert search
nnoremap <leader>// :S /
vnoremap <leader>// :S /

" Use regular replace
nnoremap <leader>s :%s /
vnoremap <leader>s :%s /

" Use :Subvert replace
nnoremap <leader>S :%S /
vnoremap <leader>S :%S /

tnoremap <F12> <C-\><C-n>
autocmd WinEnter term://* startinsert
set switchbuf+=useopen
function! TermEnter()
    let bufcount = bufnr("$")
    let currbufnr = 1
    let nummatches = 0
    let firstmatchingbufnr = 0
    while currbufnr <= bufcount
        if(bufexists(currbufnr))
            let currbufname = bufname(currbufnr)
            if(match(currbufname, "term://") > -1)
                echo currbufnr . ": ". bufname(currbufnr)
                let nummatches += 1
                let firstmatchingbufnr = currbufnr
                break
            endif
        endif
        let currbufnr = currbufnr + 1
    endwhile
    if(nummatches >= 1)
        execute ":sbuffer ". firstmatchingbufnr
        startinsert
    else
        execute ":terminal"
    endif
endfunction
map <F12> :call TermEnter()<CR>
" }}}

" {{{ Autocmds 
augroup mygroup
    autocmd!
    autocmd! BufWritePost * Neomake
    " Git tweaks
    autocmd Filetype gitcommit setlocal textwidth=72 
    autocmd FileType javascript,jsx,javascript.jsx setlocal omnifunc=tern#Complete
    " autocmd FileType unite call s:configure_unite_buffer()
    " " Search highlighting tweaks
    " autocmd InsertEnter * :set nohlsearch
    " autocmd InsertLeave * :set hlsearch
    " These next two prevent all the folds from opening beneath the cursor during edits
    autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
    " " This forces tabs in a makefile
    " autocmd filetype make setlocal noexpandtab
    " " Make text files do soft wrappping
    " autocmd BufRead,BufNewFile *.txt set wrap linebreak nolist textwidth=0 wrapmargin=0
    " NERDTree stuff
    " autocmd VimEnter * if (0 == argc()) | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
" }}}

" {{{ Plugin Config
" clever-f prompt
let g:clever_f_show_prompt = 1
let g:clever_f_across_no_line = 1

" airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "no .git"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

" Syntastic
" let g:syntastic_javascript_checkers = ['eslint']

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#deoplete_onmni_patterns = get(g:, 'deoplete#force_omni_input_patterns', {})
let g:deoplete#deoplete_onmni_patterns.javascript = '[^. \t]\.\w*'
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Neomake
let g:neomake_javascript_enabled_makers= ['eslint']
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

" Unite
let g:unite_data_directory='~/.config/nvim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_prompt='>> '
let g:unite_split_rule = 'botright'
let g:unite_source_rec_async_command =['ag', '--follow', '--nocolor', '--nogroup','--hidden', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'lib']

" Polyglot
" let g:polyglot_disabled=['javascript.jsx']

" jsx highlighting in all js files and enable react syntax
let g:jsx_ext_required = 0
let g:used_javascript_libs = 'react'

" git and ack stuff
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
nnoremap <leader>G mG:Git! 
nnoremap <leader>g :Git 
nnoremap <leader>A :!ag 
nnoremap <leader>a :Ag! 

" EasyMotion
let g:EasyMotion_smartcase = 1
" }}}

" {{{ BUG WORKAROUNDS
" realign buffers when iterm goes fullscreen
augroup FixProportionsOnResize
  au!
  au VimResized * exe "normal! \<c-w>="
augroup END

" vim mode-switch lag fix
if ! has("gui_running")
   "set ttimeoutlen=10
   "augroup FastEscape
   "    autocmd!
   "    au InsertEnter * set timeoutlen=10
   "    au InsertLeave * set timeoutlen=1000
   "augroup END
endif

" macos vs linux clipboard
if has("mac")
  set clipboard+=unnamed
else
  set clipboard=unnamedplus
endif

" make C-a, C-x work properly
set nrformats=

" potential lag fix
let g:matchparen_insert_timeout=1

" fix bufexplorer bug with hidden
let g:bufExplorerFindActive=0
" }}}

" {{{ COOL HACKS
" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     execute 'normal! g`"zvzz' |
                \ endif
augroup END

" Visual Mode */# from Scrooloose
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" Text Highlighter = <leader>h[1-4]
function! HiInterestingWord(n)
    " Save our location.
    normal! mz
    " Yank the current word into the z register.
    normal! "zyiw
    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n
    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)
    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'
    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)
    " Move back to our original location.
    normal! `z
endfunction

nnoremap <leader>hh :call clearmatches()<CR>:noh<CR>
nnoremap <silent> <leader>h1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>h2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>h3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>h4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>h5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>h6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

highlight search ctermfg=white ctermbg=3423513

" better retab
fu! Retab()
    :retab
    :%s/\s\+$//
endfunction

" Make search results appear in the middle of the screen
nnoremap <silent> <F4> :call <SID>SearchMode()<CR>
function s:SearchMode()
    if !exists('s:searchmode') || s:searchmode == 0
        echo 'Search next: scroll hit to middle if not on same page'
        nnoremap <silent> n n:call <SID>MaybeMiddle()<CR>
        nnoremap <silent> N N:call <SID>MaybeMiddle()<CR>
        let s:searchmode = 1
    elseif s:searchmode == 1
        echo 'Search next: scroll hit to middle'
        nnoremap n nzz
        nnoremap N Nzz
        let s:searchmode = 2
    else
        echo 'Search next: normal'
        nunmap n
        nunmap N
        let s:searchmode = 0
    endif
endfunction

" If cursor is in first or last line of window, scroll to middle line.
function s:MaybeMiddle()
    if winline() == 1 || winline() == winheight(0)
        normal! zz
    endif
endfunction
" }}}
