nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>a :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    execute "Ack!" . shellescape(@@)
    copen

    let @@ = saved_unnamed_register
endfunction
