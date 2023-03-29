function! FindWord()
    grep! <cword>
    botright cwindow
endfunction

function! ToggleCWindow()
    for winnr in range(1, winnr('$'))
        if getwinvar(winnr, '&syntax') == 'qf'
            cclose
            return
        endif
    endfor

    botright copen
endfunction

nnoremap <leader>fw <cmd>silent! call FindWord()<cr>
nnoremap <leader>qq <cmd>call         ToggleCWindow()<cr>

" autocmd FileType qf,netrw,dosbatch,c,cpp,h,hpp :compiler batch
" autocmd FileType go :compiler go
" autocmd FileType py :compiler python
