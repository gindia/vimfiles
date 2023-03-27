compiler batch

function! WideCopen()
    "botright copen
    botright cwindow
endfunction

function! MakeRun() 
    make run
    call WideCopen()
endfunction

function! MakeBuild() 
    wa
    make build
    call WideCopen()
endfunction

nnoremap <F5>       <cmd>silent! call MakeRun()<cr>
nnoremap <F12>      <cmd>silent! call MakeBuild()<cr>

function! SSwitchSourceHeader()
  if (expand ("%:e") == "cpp")
    find %:t:r.h
  elseif (expand ("%:e") == "h")
    find %:t:r.cpp
  endif
endfun
nmap <leader>h :call SSwitchSourceHeader()<CR>
