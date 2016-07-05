" vim: set fdm=marker fmr={{{,}}} foldlevel=0:

filetype plugin indent on

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
set completeopt-=preview
set textwidth=100
set wildmenu
set wildignorecase
set noshowmode
set cmdheight=1
set foldmethod=syntax
set foldnestmax=1
set foldlevelstart=99

" backup/persistance settings
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
" }}}

" {{{ Key Bindings
let mapleader = " "

map ; :
noremap ;; ;

" Normal
nnoremap 0 ^
nnoremap <cr> i<cr><Esc>==
nnoremap gd :BD<cr>
nnoremap gn :bn<cr>
nnoremap gp :bp<cr>
nnoremap p p=`]
nnoremap ¬ <c-w>l
nnoremap ˙ <c-w>h
nnoremap ˚ <c-w>k
nnoremap ∆ <c-w>j

nmap s <Plug>(easymotion-s)

" Insert
inoremap jk <ESC>
inoremap <expr><TAB> pumvisible() ? "\<c-n>" : "\<TAB>"

" Command
cmap w!! w !sudo tee > /dev/null %

" Visual
vnoremap < <gv
vnoremap > >gv

" NERDTree
map <c-n> :NERDTreeToggle<cr>

" {{{ Leader
nnoremap <leader>1 :tabp<return>
nnoremap <leader>2 :tabn<return>
nnoremap <leader>3 :tabm -1<return>
nnoremap <leader>4 :tabm +1<return>
nnoremap <leader><cr> :noh<cr>
nnoremap <leader>A :!ag
nnoremap <leader>a :Ag!
nnoremap <leader>bo :BufOnly<cr>
nnoremap <leader>cl :call ConsoleLog()<cr>
" nnoremap <leader>cs :BD<cr>:q<cr>
nnoremap <leader>ctw :ClearTrailingWhitespace<cr>:noh<cr>
nnoremap <leader>ds lbhxelxb
" nnoremap <leader>e in specific configs
" nnoremap <leader>f in specific configs
nnoremap <silent> <leader>h1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>h2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>h3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>h4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>h5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>h6 :call HiInterestingWord(6)<cr>
nnoremap <leader>hh :call clearmatches()<cr>:noh<cr>
nmap     <leader>j <Plug>(easymotion-j)
nmap     <leader>k <Plug>(easymotion-k)
nnoremap <leader>l :<c-u>Unite line<cr>
nnoremap <leader>o :exe 'e ' . @+<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>ra :%s/<c-r><c-w>/<c-r>"/g
nnoremap <leader>rb F{a <esc>%i <esc>
" nnoremap <leader>rc in specific configs
nnoremap <leader>rf dt(f)a =><esc>
nnoremap <leader>rr :set ft=rest<cr>
nnoremap <leader>S :%S /
nnoremap <leader>s lbi <esc>lea <esc>b
nnoremap <leader>U :UltiSnipsEdit<cr>
nnoremap <leader>v :e  ~/.dotfiles/vim/general.vimrc<cr>
nnoremap <leader>w :w!<cr>
nnoremap <leader>y :<c-u>Unite history/yank<cr>

" Visual
vnoremap <leader>/ /\v
vnoremap <leader>// :S /
vnoremap <leader>cl :call ConsoleLog()<cr>
vnoremap <leader>ds <esc>`>lx`<hx
vnoremap <leader>S :%S /
vnoremap <leader>s <esc>`>a <esc>`<i <esc>l
" }}}
" }}}

" {{{ Commands and functions
" Clear trailing whitespace
command! ClearTrailingWhitespace %s /\s\+$//g

function! ConsoleLog()
    normal! yiwoconsole.log(
    normal! pA)
endfunction

augroup mygroup
    autocmd!
    autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2
    " Git tweaks
    autocmd Filetype gitcommit setlocal textwidth=72
    autocmd FileType javascript,jsx,javascript.jsx setlocal omnifunc=tern#Complete
    " Search highlighting tweaks
    " autocmd InsertEnter * :set nohlsearch
    " autocmd InsertLeave * :set hlsearch
    " These next two prevent all the folds from opening beneath the cursor during edits
    autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
    " " Make text files do soft wrappping
    " autocmd BufRead,BufNewFile *.txt set wrap linebreak nolist textwidth=0 wrapmargin=0
    " NERDTree stuff
    " autocmd VimEnter * if (0 == argc()) | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    autocmd BufReadPost,FileReadPost,FocusGained,BufNewFile * call system("tmux rename-window ' vim " . fnamemodify(getcwd(), ':t') . "'")
    autocmd VimLeave * call system("tmux setw automatic-rename") " Consider adding FocusLost to this?
augroup END
" }}}

" {{{ Plugin Config
" Vim-Session
let g:session_directory = g:configDir.'/session'
let g:session_autoload = "no"
let g:session_autosave = "yes"
let g:session_default_to_last = 1
let g:session_command_aliases = 1

" NERDTree
let g:NERDTreeWinSize = 24
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeIgnore=['node_modules$[[dir]]','.git$[[dir]]','build$[[dir]]','.sass-cache$[[dir]]']

" UltiSnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.dotfiles/vim-ultisnips']
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Airline
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

" Unite
let g:unite_data_directory = g:configDir.'/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_prompt='>> '
let g:unite_split_rule = 'botright'
let g:unite_source_rec_async_command =['ag', '--follow', '--nocolor', '--nogroup','--hidden', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'lib']

" Polyglot
" let g:polyglot_disabled=['javascript.jsx']
let g:jsx_ext_required = 0 " jsx highlighting in all js files and
let g:used_javascript_libs = 'react' " enable react syntax

" GitGutter
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" EasyMotion
let g:EasyMotion_smartcase = 1

" Ag
let g:ag_prg = 'ag --hidden --vimgrep'
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
vnoremap * :<c-u>call <SID>VSetSearch()<cr>//<cr><c-o>
vnoremap # :<c-u>call <SID>VSetSearch()<cr>??<cr><c-o>

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
nnoremap <silent> <F4> :call <SID>SearchMode()<cr>
function! s:SearchMode()
    if !exists('s:searchmode') || s:searchmode == 0
        echo 'Search next: scroll hit to middle if not on same page'
        nnoremap <silent> n n:call <SID>MaybeMiddle()<cr>
        nnoremap <silent> N N:call <SID>MaybeMiddle()<cr>
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
function! s:MaybeMiddle()
    if winline() == 1 || winline() == winheight(0)
        normal! zz
    endif
endfunction

function! InitBackupDir()
    let l:backup = g:configDir . '/backup/'
    let l:swap = g:configDir . '/swap/'
    let l:undo = g:configDir . '/undo/'
    if exists('*mkdir')
        if !isdirectory(g:configDir)
            call mkdir(g:configDir)
        endif
        if !isdirectory(l:backup)
            call mkdir(l:backup)
        endif
        if !isdirectory(l:swap)
            call mkdir(l:swap)
        endif
        if !isdirectory(l:undo)
            call mkdir(l:undo)
        endif
    endif
    let l:missing_dir = 0
    if isdirectory(l:backup)
        execute 'set backupdir=' . escape(l:backup, ' ') . '/,.'
    else
        let l:missing_dir = 1
    endif
    if isdirectory(l:swap)
        execute 'set directory=' . escape(l:swap, ' ') . '/,.'
    else
        let l:missing_dir = 1
    endif
    if isdirectory(l:undo)
        execute 'set undodir=' . escape(l:undo, ' ') . '/,.'
    else
        let l:missing_dir = 1
    endif
    if l:missing_dir
        echo 'Warning: Unable to create backup directories:' l:backup 'and' l:swap ' and' l:undo
        echo 'Try: mkdir -p' l:backup
        echo 'and: mkdir -p' l:swap
        echo 'and: mkdir -p' l:undo
        set backupdir=.
        set directory=.
        set undodir=.
    endif
endfunction
call InitBackupDir()
" }}}
