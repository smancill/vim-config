" fortran.vim: settings for Fortran files

setlocal nowrap

setlocal tabstop=3
setlocal softtabstop=3
setlocal shiftwidth=3


nnoremap <buffer> <silent> ]]  /\v\c^\s*%(<end)@!(subroutine<bar>((\w+<bar>\w+\s*\(\w+\))\s+)*function)\s+\zs\w+<CR>zt3<C-y>
nnoremap <buffer> <silent> [[  ?\v\c^\s*%(<end)@!(subroutine<bar>((\w+<bar>\w+\s*\(\w+\))\s+)*function)\s+\zs\w+<CR>zt3<C-y>

nnoremap <buffer> <silent> ][  /\v\c^\s*end\s*(subroutine<bar>function)\s+\zs\w+<CR>zt3<C-y>
nnoremap <buffer> <silent> []  ?\v\c^\s*end\s*(subroutine<bar>function)\s+\zs\w+<CR>zt3<C-y>
