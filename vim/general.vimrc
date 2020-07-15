filetype plugin indent on

" Settings {{{
" debugging
" set verbose=9
" set verbosefile=/home/chad/Documents/vim-debug.txt

set autoindent
set backspace=indent,eol,start
set cmdheight=1
set completeopt-=preview
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set noshowmode
set nowrap
set nowritebackup
set number
set relativenumber
set ruler
set shiftwidth=4
set showmatch
set smartcase
set smarttab
set mouse=a
set softtabstop=4
set tabstop=4
set textwidth=100
set viewoptions=cursor,folds,slash,unix
set wildignorecase
set wildmenu
set list
set listchars=tab:\|\
set fileformat=unix " Possible fix to lots of odd line endings showing up
" Decided to set these because of here:
" https://www.reddit.com/r/vim/comments/7fqpny/slow_vim_scrolling_and_cursor_moving_in_iterm_and/
set regexpengine=1
set synmaxcol=1500

" backup/persistance settings
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

" persist (g)undo tree between sessions
set undofile
set history=100
set undolevels=100

" Colors
syntax on
set background=dark
set termguicolors
" }}}

" {{{ Key Bindings
let mapleader = " "

noremap X :bd<cr>

" Normal
nnoremap - dd
nnoremap <cr> i<cr><Esc>==
nnoremap gd :bd<cr>
nnoremap gn :bn<cr>
nnoremap Y y$
map <C-n> :NERDTreeToggle<CR>
noremap <M-o> :OpenSession<cr>
nnoremap gp :bp<cr>
nmap gsib gsi{
nmap QQ :q<cr>

nmap s <Plug>(easymotion-s)

" Command
" Expand %% to the directory path of the current buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Visual
vnoremap < <gv
vnoremap > >gv

" Move mappings
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" {{{ Leader
nnoremap <leader><cr> :noh<cr>
nnoremap <leader>a :Rg 
nnoremap <leader>bo :BufOnly<cr>
nnoremap <leader>ctw :ClearTrailingWhitespace<cr>:noh<cr>
" Run command in current buffer's directory
nnoremap <leader>e :!cd %:p:h;
nnoremap <leader>f :Files<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>ggh :diffget //2<cr>
nnoremap <leader>ggl :diffget //3<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gp :echo @%<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nmap <silent> <leader>j <Plug>(coc-diagnostic-next)
nmap <silent> <leader>k <Plug>(coc-diagnostic-prev)
nnoremap <leader>n :NERDTreeFind<cr>
nnoremap <leader>o za
nnoremap <leader>Q :q!<cr>
" nnoremap <leader>rc in specific configs
nnoremap <leader>rs <esc>:syntax sync fromstart<cr>
nnoremap <leader>rw :Rg <c-r><c-w><cr>
" {{{ <leader>t --- typescript namespaced mappings
nmap <silent> <leader>td <Plug>(coc-definition)
nmap <silent> <leader>tt <Plug>(coc-type-definition)
nmap <silent> <leader>th :call CocActionAsync('doHover')<cr>
nmap <silent> <leader>to :call CocAction('runCommand', 'editor.action.organizeImport')<cr>
nmap <silent> <leader>ti <Plug>(coc-implementation)
nmap <silent> <leader>tr <Plug>(coc-references)
" }}}
nnoremap <leader>U :CocCommand snippets.editSnippets<cr>
nnoremap <leader>w :w!<cr>

" Visual
vnoremap <leader>cl yoconsole.log(<esc>pa)<esc>
" }}}
" }}}

" {{{ Commands and functions
" Clear trailing whitespace
command! ClearTrailingWhitespace %s /\s\+$//g

command! G Git
cnoreabbrev G Git
command! Gsave :!git save

command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:VimTodoListsCustomKeyMapper = 'VimTodoListsCustomMappings'

function! VimTodoListsCustomMappings()
  nnoremap <buffer> o :VimTodoListsCreateNewItemBelow<CR>
  nnoremap <buffer> O :VimTodoListsCreateNewItemAbove<CR>
  nnoremap <buffer> <leader>j ddp
  nnoremap <buffer> <leader>k ddkp
  nnoremap <buffer> j :VimTodoListsGoToNextItem<CR>
  nnoremap <buffer> k :VimTodoListsGoToPreviousItem<CR>
  nnoremap <buffer> <CR> :VimTodoListsToggleItem<CR>
  vnoremap <buffer> <CR> :VimTodoListsToggleItem<CR>
  inoremap <buffer> <CR> <CR><ESC>:VimTodoListsCreateNewItem<CR>
  noremap <buffer> <leader>e :silent call VimTodoListsSetNormalMode()<CR>
endfunction

function! ProfileStart()
    profile start profile.log
    profile func *
    profile file *
endfunction

function! ProfileEnd()
    profile pause
    noautocmd qall!
endfunction

augroup mygroup
    autocmd!
    " Git tweaks
    autocmd Filetype gitcommit setlocal textwidth=72 colorcolumn=51

    autocmd Filetype vim setlocal foldmethod=marker foldlevel=0

    autocmd BufNewFile,BufRead *plist setlocal noexpandtab
    autocmd BufNewFile,BufRead .envrc* setlocal ft=zsh
    
    " Set filetype to docker for anything that starts with Dockerfile
    autocmd BufNewFile,BufRead Dockerfile* set syntax=dockerfile

    " Set filetype to json for VRC
    autocmd BufNewFile,BufRead __REST_response__ set ft=json

    autocmd Filetype markdown setlocal textwidth=80 ts=2 sts=2 sw=2

    " Javascript/typescript tab width, fold method
    autocmd Filetype javascript,typescript,json setlocal tw=80 ts=2 sts=2 sw=2 fdm=syntax foldlevel=99 colorcolumn=81

    " NERDTree stuff
    autocmd bufenter * if @% == '__doc__' | nnoremap <silent> <buffer> q :bd<cr> | endif

    autocmd FileType typescript let b:coc_root_patterns = ['tsconfig.json']

    " NERDTree stuff
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " Automatically update diff on save of either file
    autocmd BufWritePost * if &diff == 1 | diffupdate | endif

    " Set yaml folds to 2 space
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " Update save mapping to format with prettier in compatible filetypes
    autocmd BufNewFile,BufRead *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html nnoremap <buffer> <leader>w :PrettierAsync<cr>:w!<cr>

    " fzf hide statusline
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

augroup filetype_help
    autocmd!
    autocmd BufWinEnter * if &l:buftype ==# 'help' | nnoremap <silent> <buffer> q :bd<cr> | endif
augroup END

augroup filetype_quickfix
    autocmd!
    autocmd BufWinEnter quickfix nnoremap <silent> <buffer> q :cclose<cr>:lclose<cr>
    autocmd BufWinEnter quickfix nnoremap <silent> <buffer> <cr> :.cc<cr>
    autocmd BufWinEnter quickfix nnoremap <silent> <buffer> o :.cc<cr>
augroup END
" }}}

" {{{ Plugin Config
" vim-terraform
let g:terraform_fmt_on_save=1

" vim-instant-markdown
let g:instant_markdown_autostart=0

" {{{ COC
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-eslint',
    \ 'coc-go',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-snippets',
    \ 'coc-tsserver'
    \ ]

" Coc-snippets
imap <C-l> <Plug>(coc-snippets-expand-jump)
vmap <C-j> <Plug>(coc-snippets-select)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" }}}

" {{{ VRC
let g:vrc_curl_opts = {
  \ '-sS': '',
  \ '--connect-timeout': 10,
  \ '-b': '/home/chad/.curl-cookie-jar',
  \ '-c': '/home/chad/.curl-cookie-jar',
  \ '-i': '',
  \ '--max-time': 60,
  \ '-k': '',
\}
let g:vrc_split_request_body=1
" }}}

" {{{ dbext
" dbext
let g:dbext_default_profile_local = 'type=PGSQL:user=postgres:dbname=yaguara:host=localhost'
let g:dbext_default_profile_prod = 'type=PGSQL:user=i8jEDBevToM:dbname=yaguara:host=yaguara-web-production.cv360oyfmcuy.us-east-2.rds.amazonaws.com'
let g:dbext_default_profile = 'local'
let g:dbext_default_history_file = '/home/chad/.dbext_sql_history.txt'
" }}}

" {{{ Colorscheme
" gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_bold = 1
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
" }}}

" {{{ Syntax plugin configs
" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

" json stuff
let g:vim_json_syntax_concealcursor = 0

" indentLine json stuff
let g:indentLine_concealcursor = ""

" vim-jsx
let g:jsx_ext_required = 0
" }}}

" buftabline
let g:buftabline_show = 1
let g:buftabline_indicators = 1

" closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" {{{ FZF
" CTRL-A CTRL-Q to select all and build quickfix list
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_COMMAND="rg -g '!.git' --files --hidden --follow --ignore-file ~/.rgignore"
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --ignore-file ~/.rgignore --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* Rgm
  \ call fzf#vim#grep(
  \   'rg --hidden --ignore-file ~/.rgignore --column --line-number --no-heading --color=always --smart-case --max-count=1 '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" }}}

" Vim-Session
" let g:session_directory = g:configDir.'/session'
" let g:session_autoload = "no"
" let g:session_autosave = "yes"
" let g:session_verbose_messages = 0
" let g:session_lock_enabled = 0
" let g:session_default_to_last = 0
" let g:session_default_name = fnamemodify(getcwd(), ':t')
set sessionoptions=blank,buffers,curdir,folds

" vim-devicons
let g:webdevicons_enable_nerdtree = 1

" {{{ NERDTree
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMapJumpNextSibling = ''
let g:NERDTreeMapJumpPrevSibling = ''
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
" }}}

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" pgsql.vim
let g:sql_type_default = 'pgsql'

" {{{ Lightline
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \           [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }
" }}}

" GitGutter
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" EasyMotion
let g:EasyMotion_smartcase = 1
" }}}

" {{{ BUG WORKAROUNDS
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

" {{{ Mac c-h, c-l, c-j, c-k mappings
" nnoremap ¬ <c-w>l
" nnoremap ˙ <c-w>h
" nnoremap ˚ <c-w>k
" nnoremap ∆ <c-w>j
" }}}
" }}}

" {{{ COOL HACKS
" {{{ Line return
" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
augroup END
" }}}

" {{{ Backup directory initialization
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

" {{{ Underline
" Underline function from here: http://vim.wikia.com/wiki/Underline_using_dashes_automatically
" Use like this :Underline =
function! s:Underline(chars)
    let chars = empty(a:chars) ? '-' : a:chars
    let nr_columns = virtcol('$') - 1
    let uline = repeat(chars, (nr_columns / len(chars)) + 1)
    put =strpart(uline, 0, nr_columns)
endfunction
command! -nargs=? Underline call s:Underline(<q-args>)
" }}}
" }}}
