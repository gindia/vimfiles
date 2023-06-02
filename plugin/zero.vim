function! ToggleCWindow()
    for winnr in range(1, winnr('$'))
        if getwinvar(winnr, '&syntax') == 'qf'
            cclose
            return
        endif
    endfor

    botright copen
endfunction
nnoremap <leader>qq <cmd>call         ToggleCWindow()<cr>
