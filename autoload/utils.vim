function! utils#MoveToTab(direction, actual_state)
    let b:mode_state = a:actual_state
    if a:direction == "p"
        tabprev
    else
        tabnext
    endif
    if exists("b:mode_state") && b:mode_state == "i"
        normal $
        let s:lcol = col(".")
        normal '^
        let s:ccol = col(".")
        if s:ccol == s:lcol
            startinsert!
        else
            startinsert
        endif
    endif
endfunction


function! utils#CloseLast()
    if &buftype=="quickfix" || &buftype=="nofile"
        " if this window is last on screen quit without warning
        if winbufnr(2) == -1
            quit!
        endif
    endif
endfunction