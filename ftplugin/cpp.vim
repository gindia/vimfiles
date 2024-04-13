set shiftwidth=4

set path=.,,..,../..,./*,./*/*,../*,./**,../**
" set path+=,include
" set path+=,C:/Program\\\ Files/Microsoft\\\ Visual\\\ Studio/2022/Community/VC/Tools/MSVC/14.34.31933/include
" set path+=,C:/Program\\\ Files/Microsoft\\\ Visual\\\ Studio/2022/Community/VC/Tools/MSVC/14.34.31933/ATLMFC/include
" set path+=,C:/Program\\\ Files/Microsoft\\\ Visual\\\ Studio/2022/Community/VC/Auxiliary/VS/include
" set path+=,C:/Program\\\ Files\\\ (x86)/Windows\\\ Kits/10/include/10.0.22621.0/ucrt
" set path+=,C:/Program\\\ Files\\\ (x86)/Windows\\\ Kits/10//include/10.0.22621.0/um
" set path+=,C:/Program\\\ Files\\\ (x86)/Windows\\\ Kits/10//include/10.0.22621.0/shared
" set path+=,C:/Program\\\ Files\\\ (x86)/Windows\\\ Kits/10//include/10.0.22621.0/winrt
" set path+=,C:/Program\\\ Files\\\ (x86)/Windows\\\ Kits/10//include/10.0.22621.0/cppwinrt
" set path+=,E:/w/global_external_prebuilds/include


" set path=.,,..,../..,./*,./*/*,../*,~/,~/**,/usr/include/*

function! Mosh_Flip_Ext()
  " Switch editing between .c* and .h* files (and more).
  " Since .h file can be in a different dir, call find.
  if match(expand("%"),'\.cpp') > 0
    let s:flipname = substitute(expand("%"),'\.cpp\(.*\)','.h\1',"")
    exe ":find " s:flipname
  elseif match(expand("%"),"\\.h") > 0
    let s:flipname = substitute(expand("%"),'\.h\(.*\)','.cpp\1',"")
    exe ":find " s:flipname
  endif
endfun

map <leader>h :call Mosh_Flip_Ext()<CR>
