compiler py

function! MakePython()
    make %
    botright copen
endfunction

nnoremap <F12>      <cmd>silent! call MakePython()<cr>
