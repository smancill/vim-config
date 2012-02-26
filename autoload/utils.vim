function! utils#Bclose()
    let curbufnr = bufnr("%")
    let altbufnr = bufnr("#")

    if buflisted(altbufnr)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == curbufnr
        new
    endif

    if buflisted(curbufnr)
        execute("bdelete! " . curbufnr)
    endif
endfunction


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
