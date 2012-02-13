setlocal textwidth=78                       " Use 78 columns for text width
setlocal tabstop=2                          " Tabs use 2 spaces
setlocal softtabstop=2                      " Tabs use 2 spaces
setlocal shiftwidth=2                       " Indent using 2 spaces
setlocal formatoptions=tq                   " Format text
setlocal linebreak                          " Smart breaking of long lines
setlocal spell                              " Use spell

function! Jump2LaTeXSection(cnt, dir)
    let i = 0
    let pat = '^\\\(part\|chapter\|\(sub\)*section\|paragraph\)\>\|\%$\|\%^'
    let flags = 'W' . a:dir
    while i < a:cnt && search( pat, flags ) > 0
        let i = i+1
    endwhile
    let @/ = pat
endfunction

nnoremap <buffer> <silent>  ]]      :<C-U>call Jump2LaTeXSection(v:count1, '')<CR>
nnoremap <buffer> <silent>  [[      :<C-U>call Jump2LaTeXSection(v:count1, 'b')<CR>
