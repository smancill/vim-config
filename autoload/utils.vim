function! utils#CloseLast()
    if &buftype=="quickfix" || &buftype=="nofile"
        " if this window is last on screen quit without warning
        if winbufnr(2) == -1
            quit!
        endif
    endif
endfunction
